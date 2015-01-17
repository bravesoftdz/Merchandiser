unit U_fungsi;

interface

uses
Classes,DB,ShellAPI,SysUtils,dialogs,mySQLDbTables,Windows;

  type
  Tfungsi = class (TObject)//kita membuat object baru dengan nama TProsedur
  private
    {private declaration}
  public
     function program_versi:string;
     function caridanganti(sSrc, sLookFor, sReplaceWith : string) : string;
     procedure hapusdir(const DirName: string);
     procedure savetofile(aQuery:TmySQLQuery; _SQL,nm_file:string);
     procedure amankan(pathin, pathout: string; Chave: Word);
     procedure SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
     procedure loadSQL(aQuery:TmySQLQuery; _SQL:string);
  end;
implementation

uses u_dm, U_Login;

function Tfungsi.program_versi:string;
var V1, V2, V3, V4: Word;
   VerInfoSize, VerValueSize, Dummy : DWORD;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
With VerValue^ do
begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
end;
FreeMem(VerInfo, VerInfoSize);

Result := IntToStr(V1) + '.' 
            + IntToStr(V2) + '.' 
            + IntToStr(V3) + '.' 
            + IntToStr(V4);
end;

procedure Tfungsi.hapusdir(const DirName: string);
var
  FileOp: TSHFileOpStruct;
begin
  FillChar(FileOp, SizeOf(FileOp), 0);
  FileOp.wFunc := FO_DELETE;
  FileOp.pFrom := PChar(DirName+#0);//double zero-terminated
  FileOp.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileOp);
end;

procedure Tfungsi.amankan(pathin, pathout: string; Chave: Word);
var
  InMS, OutMS: TMemoryStream;
  cnt: Integer;
  C: byte;
begin
  InMS  := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;
  try
    InMS.LoadFromFile(pathin);
    InMS.Position := 0;
    for cnt := 0 to InMS.Size - 1 DO
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


procedure Tfungsi.savetofile(aQuery:TmySQLQuery; _SQL,nm_file:string);
var I:Integer;
  X: TextFile;
  S1:string;
begin
assignfile(X,nm_file);
rewrite(X);

SQLExec(aQuery,_SQL,True);
  while not aQuery.Eof do
  begin
  S1:='';
    for I:=0 to aQuery.FieldCount-2 do
    begin
        if aQuery.Fields[I].DataType in [ftSmallint, ftInteger, ftFloat, ftCurrency, ftLargeint]  then
           S1 := S1 +floattostr(aQuery.Fields[I].AsFloat)+'&' else
        if aQuery.Fields[I].DataType in [ftDate]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd', aQuery.Fields[I].AsDateTime)+'#&' else
        if aQuery.Fields[I].DataType in [ftDateTime]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd hh:nn:ss', aQuery.Fields[I].AsDateTime)+'#&' else
           S1 := S1 + '#'+aQuery.Fields[I].AsString+'#&';
    end;

    if aQuery.Fields.FieldByNumber(aQuery.FieldCount-1)<>nil then
        begin
        if aQuery.Fields[I].DataType in [ftSmallint, ftInteger, ftFloat, ftCurrency, ftLargeint]  then
           S1 := S1 +floattostr(aQuery.Fields[I].AsFloat) else
        if aQuery.Fields[I].DataType in [ftDate]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd', aQuery.Fields[I].AsDateTime)+'#' else
        if aQuery.Fields[I].DataType in [ftDateTime]  then
           S1 := S1 + '#'+formatdatetime('yyyy-MM-dd hh:nn:ss', aQuery.Fields[I].AsDateTime)+'#' else
           S1 := S1 + '#'+aQuery.Fields[I].AsString+'#';
        end;

     // Added for ExtendInsert support
        S1 := Format('%s%s%s',['<',S1,'>']);
        Write(X,S1);

     // End modification
//        Result := Trunc(aQuery.RecNo*100/(aQuery.RecordCount-1));
        aQuery.Next;
     end;
closefile(X);
amankan(nm_file,nm_file,9966);
end;

function Tfungsi.caridanganti
  (sSrc, sLookFor, sReplaceWith : string) : string;
var
  nPos, nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while (nPos > 0) do begin
    Delete(sSrc, nPos, nLenLookFor);
    Insert(sReplaceWith, sSrc, nPos);
    nPos := Pos(sLookFor, sSrc);
  end;
  Result := sSrc;
end;

  procedure Tfungsi.SQLExec(aQuery:TmySQLQuery; _SQL:string; isSearch: boolean);
	 begin
	  with aQuery  do
	   begin
      DisableControls;
	    Close;
      sql.Clear;
	    SQL.Text := _SQL;
	    if isSearch then
	     Open
	    else
	     ExecSQL;
      EnableControls;
	   end;
	 end;

  procedure Tfungsi.loadSQL(aQuery:TmySQLQuery; _SQL:string);
	 begin
	  with aQuery  do
	   begin
      DisableControls;
	    Close;
      sql.Clear;
	    SQL.LoadFromFile(_SQL);
	    ExecSQL;
      EnableControls;
	   end;
	 end;

end.
