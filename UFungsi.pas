unit UFungsi;

interface

uses
  Classes, mySQLDbTables, DB, sysutils, ShellAPI, windows, WinInet, Winsock,
  TlHelp32;

type
  TQueryTread = class(TThread)
  private
    FQuery: TmySQLQuery;
    FText: string;
    iscari: Boolean;
  protected
    procedure Execute; override;
    procedure ThreadExecute;
  public
    constructor create(_query: TmySQLQuery; _text: string; is_cari: Boolean);
  end;

type
  Tfungsi = class(TObject)
  private
    {private declaration}
  public
    function CariDanGanti(sSrc, sLookFor, sReplaceWith: string): string;
    function GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
    function GetVersiApp: string;
    procedure Amankan(pathin, pathout: string; Chave: Word);
    procedure HapusDir(const DirName: string);
    procedure LoadSQL(aQuery: TmySQLQuery; _SQL: string);
    procedure SaveToFile(aQuery: TmySQLQuery; _SQL, nm_file: string);
    procedure SQLExec(aQuery: TmySQLQuery; _SQL: string; isSearch: boolean);
    procedure SQLExecT(aQuery: TmySQLQuery; _SQL: string; isSearch: boolean);
  end;

var
  fungsi: Tfungsi;

implementation

{ TQueryTread }

procedure TQueryTread.Execute;
begin
  Synchronize(ThreadExecute);
end;

procedure TQueryTread.ThreadExecute();
begin
  with FQuery do
  begin
    Close;
    sql.Clear;
    SQL.Text := FText;
    if iscari then
      Open
    else
      ExecSQL;
  end;
end;

constructor TQueryTread.create(_query: TmySQLQuery; _text: string; is_cari: Boolean);
begin
  inherited create(False);
  Self.FQuery := _query;
  Self.FText := _text;
  Self.iscari := is_cari;
  FreeOnTerminate := True;
  Resume;
end;

{ Tfungsi }

function Tfungsi.CariDanGanti(sSrc, sLookFor, sReplaceWith: string): string;
var
  nPos, nLenLookFor: integer;
begin
  nPos := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while (nPos > 0) do
  begin
    Delete(sSrc, nPos, nLenLookFor);
    Insert(sReplaceWith, sSrc, nPos);
    nPos := Pos(sLookFor, sSrc);
  end;
  Result := sSrc;
end;

function Tfungsi.GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
type
  Name = array[0..100] of Char;

  PName = ^Name;
var
  HEnt: pHostEnt;
  HName: PName;
  WSAData: TWSAData;
  i: Integer;
begin
  Result := False;
  if WSAStartup($0101, WSAData) <> 0 then
  begin
    WSAErr := 'Winsock is not responding."';
    Exit;
  end;
  IPaddr := '';
  New(HName);
  if GetHostName(HName^, SizeOf(Name)) = 0 then
  begin
    HostName := StrPas(HName^);
    HEnt := GetHostByName(HName^);
    for i := 0 to HEnt^.h_length - 1 do
      IPaddr := Concat(IPaddr, IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.');
    SetLength(IPaddr, Length(IPaddr) - 1);
    Result := True;
  end
  else
  begin
    case WSAGetLastError of
      WSANOTINITIALISED:
        WSAErr := 'WSANotInitialised';
      WSAENETDOWN:
        WSAErr := 'WSAENetDown';
      WSAEINPROGRESS:
        WSAErr := 'WSAEInProgress';
    end;
  end;
  Dispose(HName);
  WSACleanup;
end;

function Tfungsi.GetVersiApp: string;
var
  V1, V2, V3, V4: Word;
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);

  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4);
end;

procedure Tfungsi.Amankan(pathin, pathout: string; Chave: Word);
var
  InMS, OutMS: TMemoryStream;
  cnt: Integer;
  C: byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;
  try
    InMS.LoadFromFile(pathin);
    InMS.Position := 0;
    for cnt := 0 to InMS.Size - 1 do
    begin
      InMS.Read(C, 1);
      C := (C xor not (ord(chave shr cnt)));
      OutMS.Write(C, 1);
    end;
    OutMS.SaveToFile(pathout);
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;

procedure Tfungsi.HapusDir(const DirName: string);
var
  FileOp: TSHFileOpStruct;
begin
  FillChar(FileOp, SizeOf(FileOp), 0);
  FileOp.wFunc := FO_DELETE;
  FileOp.pFrom := PChar(DirName + #0); //double zero-terminated
  FileOp.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileOp);
end;

procedure Tfungsi.LoadSQL(aQuery: TmySQLQuery; _SQL: string);
begin
  with aQuery do
  begin
    DisableControls;
    Close;
    sql.Clear;
    SQL.LoadFromFile(_SQL);
    ExecSQL;
    EnableControls;
  end;
end;

procedure Tfungsi.SaveToFile(aQuery: TmySQLQuery; _SQL, nm_file: string);
var
  I: Integer;
  X: TextFile;
  S1: string;
begin
  assignfile(X, nm_file);
  rewrite(X);

  SQLExec(aQuery, _SQL, True);
  while not aQuery.Eof do
  begin
    S1 := '';
    for I := 0 to aQuery.FieldCount - 2 do
    begin
      if aQuery.Fields[I].DataType in [ftSmallint, ftInteger, ftFloat,
        ftCurrency, ftLargeint] then
        S1 := S1 + floattostr(aQuery.Fields[I].AsFloat) + '&'
      else if aQuery.Fields[I].DataType in [ftDate] then
        S1 := S1 + '#' + formatdatetime('yyyy-MM-dd', aQuery.Fields[I].AsDateTime) + '#&'
      else if aQuery.Fields[I].DataType in [ftDateTime] then
        S1 := S1 + '#' + formatdatetime('yyyy-MM-dd hh:nn:ss', aQuery.Fields[I].AsDateTime)
          + '#&'
      else
        S1 := S1 + '#' + aQuery.Fields[I].AsString + '#&';
    end;

    if aQuery.Fields.FieldByNumber(aQuery.FieldCount - 1) <> nil then
    begin
      if aQuery.Fields[I].DataType in [ftSmallint, ftInteger, ftFloat,
        ftCurrency, ftLargeint] then
        S1 := S1 + floattostr(aQuery.Fields[I].AsFloat)
      else if aQuery.Fields[I].DataType in [ftDate] then
        S1 := S1 + '#' + formatdatetime('yyyy-MM-dd', aQuery.Fields[I].AsDateTime) + '#'
      else if aQuery.Fields[I].DataType in [ftDateTime] then
        S1 := S1 + '#' + formatdatetime('yyyy-MM-dd hh:nn:ss', aQuery.Fields[I].AsDateTime)
          + '#'
      else
        S1 := S1 + '#' + aQuery.Fields[I].AsString + '#';
    end;

    S1 := Format('%s%s%s', ['<', S1, '>']);
    Write(X, S1);

    aQuery.Next;
  end;
  closefile(X);
  amankan(nm_file, nm_file, 9966);
end;

procedure Tfungsi.SQLExec(aQuery: TmySQLQuery; _SQL: string; isSearch: boolean);
begin
  with aQuery do
  begin
    Close;
    sql.Clear;
    SQL.Text := _SQL;
    if isSearch then
      Open
    else
      ExecSQL;
  end;
end;

procedure Tfungsi.SQLExecT(aQuery: TmySQLQuery; _SQL: string; isSearch: boolean);
begin
  TQueryTread.Create(aQuery, _SQL, isSearch);
end;

end.

