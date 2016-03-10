unit u_dm;

interface

uses
  SysUtils, Classes, DB, mySQLDbTables, sSkinManager, frxClass, frxDBSet,
  frxExportXML, dialogs, forms, inifiles, u_fungsi, ImgList, Controls,
  acAlphaImageList, frxBarcode, Windows, cxStyles, SHFolder;

type
  Tdm = class(TDataModule)
    db_conn: TmySQLDatabase;
    Q_Exe: TmySQLQuery;
    sm: TsSkinManager;
    Q_show: TmySQLQuery;
    Q_temp: TmySQLQuery;
    ds_barang: TDataSource;
    ds_mutasi: TDataSource;
    ds_mutasi_toko: TDataSource;
    ds_gross: TDataSource;
    frxXMLExport1: TfrxXMLExport;
    laporan: TfrxReport;
    Q_laporan: TmySQLQuery;
    db_laporan: TfrxDBDataset;
    gambar: TsAlphaImageList;
    ds_koreksi: TDataSource;
    ds_stok_out: TDataSource;
    Q_mutasi_toko: TmySQLQuery;
    Q_gross: TmySQLQuery;
    q_stock_out: TmySQLQuery;
    im: TsAlphaImageList;
    Q_koreksi: TmySQLQuery;
    Q_cari: TmySQLQuery;
    ds_cari: TDataSource;
    frxbrcdbjct1: TfrxBarCodeObject;
    Q_list_receipt: TmySQLQuery;
    ds_list_receipt: TDataSource;
    Q_list_return: TmySQLQuery;
    ds_list_return: TDataSource;
    Q_list_purchase: TmySQLQuery;
    ds_list_purchase: TDataSource;
    stl_focus: TcxStyleRepository;
    cxstyl1: TcxStyle;
    Q_LIST_SO: TmySQLQuery;
    ds_ist_SO: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure smAfterChange(Sender: TObject);
  private
    { Private declarations }
  public
    a_path, AppPath: string;
    { Public declarations }
  end;

var
  dm: Tdm;
  fungsi: tfungsi;
  pilihan: integer;
  kd_comp, kd_operator, n_operator: string;
  metu_kabeh: Boolean;
  Mgs: TMsg;

implementation

{$R *.dfm}

function GetAppData(Folder: Integer): string;
var
  path: array[0..MAX_PATH] of Char;
begin
  if Succeeded(SHGetFolderPath(0, Folder, 0, 0, @Path[0])) then
    Result := path + '\Gain Profit\'
  else
    Result := '';
end;

function krupuk(const s: string; CryptInt: Integer): string;
var
  i: integer;
  s2: string;
begin
  if not (Length(s) = 0) then
    for i := 1 to Length(s) do
      s2 := s2 + Chr(Ord(s[i]) - cryptint);
  Result := s2;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  data, pusat, jalur1, jalur2, nama, kata: string;
  X: TextFile;
  appINI: TIniFile;
begin
  a_path := extractfilepath(application.ExeName);

  AppPath := GetAppData(CSIDL_COMMON_APPDATA);
  if not (DirectoryExists(AppPath)) then
    CreateDir(AppPath);

  DocPath := GetAppData(CSIDL_PERSONAL);
  if not (DirectoryExists(DocPath)) then
    CreateDir(DocPath);

  sm.SkinDirectory := AppPath + 'skins';

  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    kd_comp := appINI.ReadString('toko', 'kd_perusahaan', '');
    sm.SkinName := appINI.ReadString('toko', 'nama_skin', 'Air');
    sm.HueOffset := appini.ReadInteger('toko', 'hue_skin', 0);
    sm.Saturation := appini.ReadInteger('toko', 'sat_skin', 0);
  finally
    appINI.Free;
  end;

  sm.Active := true;

  db_conn.Connected := False;

  assignfile(X, 'tools\koneksi.cbCon');
  try
    reset(X);
    readln(X, pusat);
    readln(X, data);
    readln(X, jalur2);
    readln(X, nama);
    readln(X, kata);
    closefile(X);
    db_conn.Host := krupuk(pusat, 6);
    db_conn.DatabaseName := krupuk(data, 6);
    jalur1 := krupuk(jalur2, 6);
    db_conn.Port := strtoint(jalur1);
    db_conn.UserName := krupuk(nama, 6);
    db_conn.UserPassword := krupuk(kata, 6);
    db_conn.Connected := true;

  except
    showmessage('koneksi tidak berhasil');
    application.Terminate;
  end;
end;

procedure Tdm.smAfterChange(Sender: TObject);
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(AppPath + 'gain.ini');
  try
    appINI.WriteString('toko', 'nama_skin', dm.sm.SkinName);
    appINI.WriteInteger('toko', 'hue_skin', dm.sm.HueOffset);
    appINI.WriteInteger('toko', 'sat_skin', dm.sm.Saturation);
  finally
    appINI.Free;
  end;
end;

end.

