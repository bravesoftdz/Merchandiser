unit u_kirim_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi, DB, sDialogs, ComCtrls, acShellCtrls, sTooledit, AbZView,
  AbZipKit, AbView, AbBrowse, AbZipper, ExtCtrls, AbUnZper, sSkinProvider,
  ShellAPI, ShlObj, Winsock, AbZBrows, Grids, StdCtrls, Mask,
  Vcl.Samples.Gauges, AbBase, sMaskEdit, sCustomComboEdit;

type
  TF_kirim_data = class(TForm)
    pc_1: TPageControl;
    ts_1: TTabSheet;
    ts_2: TTabSheet;
    edt_terima: TsDateEdit;
    zk_load: TAbZipKit;
    zv_load: TAbZipView;
    spnl_load: TPanel;
    od_load: TOpenDialog;
    sknprvdr1: TsSkinProvider;
    sg_load: TGauge;
    l_1: TLabel;
    spnl1: TPanel;
    edt_kirim: TsDateEdit;
    b_kirim: TButton;
    spnl2: TPanel;
    sButton3: TButton;
    sButton2: TButton;
    sButton1: TButton;
    procedure b_kirimClick(Sender: TObject);
    procedure cek_dir_kirim;
    procedure cek_dir_terima;
    procedure FormShow(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    dir_simpan, dir_zip, file_load, dir_load: string;
  end;

var
  F_kirim_data: TF_kirim_data;

const
  OFASI_EDIT = $0001;
  OFASI_OPENDESKTOP = $0002;

implementation

uses
  u_dm, u_setor;

{$R *.dfm}
{$IFDEF UNICODE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall;
  external shell32 name 'ILCreateFromPathW';
{$ELSE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall;
  external shell32 name 'ILCreateFromPathA';
{$ENDIF}
procedure ILFree(pidl: PItemIDList)stdcall; external shell32;

function SHOpenFolderAndSelectItems(pidlFolder: PItemIDList; cidl: Cardinal;
  apidl: pointer; dwFlags: DWORD): HRESULT; stdcall; external shell32;

function pilih_data(const FileName: string): boolean;
var
  IIDL: PItemIDList;
begin
  result := false;
  IIDL := ILCreateFromPath(PChar(FileName));
  if IIDL <> nil then
    try
      result := SHOpenFolderAndSelectItems(IIDL, 0, nil, 0) = S_OK;
    finally
      ILFree(IIDL);
    end;
end;

procedure TF_kirim_data.cek_dir_kirim;
begin
  if not DirectoryExists(dm.DocPath + 'DATA_KIRIM') then
    MkDir(dm.DocPath + 'DATA_KIRIM');

  dir_zip := 'CP_' + dm.kd_perusahaan + '_' + formatdatetime('yyyy-MM-dd',
    edt_kirim.Date);
  dir_simpan := dm.DocPath + 'DATA_KIRIM\' + dir_zip;

  if not DirectoryExists(dir_simpan) then
    MkDir(dir_simpan);
end;

procedure TF_kirim_data.cek_dir_terima;
begin
  if not DirectoryExists(dm.DocPath + 'DATA_TERIMA') then
    MkDir(dm.DocPath + 'DATA_TERIMA');

  dir_load := dm.DocPath + 'DATA_TERIMA\';
  file_load := dm.DocPath + 'DATA_TERIMA\PC_' + dm.kd_perusahaan + '_' +
    formatdatetime('yyyy-MM-dd', edt_terima.Date) + '.zip';
end;

procedure TF_kirim_data.b_kirimClick(Sender: TObject);
var
  namafile: string;
  zipp: TAbZipper;
  Host, IP, Err, ip_kasir: string;
begin
  if fungsi.GetIPFromHost(Host, IP, Err) then
    ip_kasir := IP // masupin local IP ke edit1
  else
    MessageDlg(Err, mtError, [mbOk], 0);

  fungsi.SQLExec(dm.Q_temp,
    'select tanggal from tb_login_kasir where kd_perusahaan="' +
    dm.kd_perusahaan + '" ' + 'and kd_jaga="' + dm.kd_pengguna +
    '"  and `status` = ''online'' and date(tanggal)=' +
    QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) +
    ' order by `status` ASC limit 1', true);
  if not(dm.Q_temp.Eof) then
  begin
    showmessage('tidak dapat kirim data karena ada kasir yang belum Setor....');
    application.CreateForm(tF_Setor, F_setor);
    F_setor.ShowModal;
    Exit;
  end;

  cek_dir_kirim;

  if FileExists(dir_simpan + '.zip') then
    DeleteFile(dir_simpan + '.zip');

  zipp := TAbZipper.Create(Self);
  zipp.AutoSave := true;
  zipp.BaseDirectory := dm.DocPath + 'DATA_KIRIM\';
  zipp.FileName := dir_simpan + '.zip';

  try
    sg_load.Visible := true;
    sg_load.MaxValue := 16;

    fungsi.SQLExec(dm.Q_Exe,
      'replace into tb_export_import(kd_perusahaan, data, ket, tanggal) values ("'
      + dm.kd_perusahaan + '","' + ExtractFileName(zipp.FileName) +
      '","kirim",now())', false);

    sg_load.Progress := 1;

    namafile := dir_simpan + '\tb_login_kasir.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_login_kasir where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and date(tanggal)=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_login_kasir.cbT', 0);
    sg_load.Progress := 2;

    namafile := dir_simpan + '\tb_jual_batal.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_jual_batal	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_transaksi=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_jual_batal.cbT', 0);
    sg_load.Progress := 3;

    namafile := dir_simpan + '\tb_jual_global.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_jual_global	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_transaksi=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_jual_global.cbT', 0);
    sg_load.Progress := 4;

    namafile := dir_simpan + '\tb_jual_rinci.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_jual_rinci	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_jual_rinci.cbT', 0);
    sg_load.Progress := 5;

    namafile := dir_simpan + '\tb_koreksi_global.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_koreksi_global	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_koreksi=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_koreksi_global.cbT', 0);
    sg_load.Progress := 6;

    namafile := dir_simpan + '\tb_koreksi_rinci.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_koreksi_rinci	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_koreksi=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_koreksi_rinci.cbT', 0);
    sg_load.Progress := 7;

    namafile := dir_simpan + '\tb_purchase_global.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_purchase_global	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_purchase=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_purchase_global.cbT', 0);
    sg_load.Progress := 8;

    namafile := dir_simpan + '\tb_purchase_rinci.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_purchase_rinci	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_purchase=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_purchase_rinci.cbT', 0);
    sg_load.Progress := 9;

    namafile := dir_simpan + '\tb_receipt_global.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_receipt_global	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_receipt=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_receipt_global.cbT', 0);
    sg_load.Progress := 10;

    namafile := dir_simpan + '\tb_receipt_rinci.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_receipt_rinci	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_receipt=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_receipt_rinci.cbT', 0);
    sg_load.Progress := 11;

    namafile := dir_simpan + '\tb_return_global.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_return_global	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_return=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_return_global.cbT', 0);
    sg_load.Progress := 12;

    namafile := dir_simpan + '\tb_return_rinci.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_return_rinci	 where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_return=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_return_rinci.cbT', 0);
    sg_load.Progress := 13;

    namafile := dir_simpan + '\tb_return_jual_global.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_return_jual_global where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_return_jual=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_return_jual_global.cbT', 0);
    sg_load.Progress := 14;

    namafile := dir_simpan + '\tb_return_jual_rinci.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_return_jual_rinci where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and tgl_return_jual=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_return_jual_rinci.cbT', 0);
    sg_load.Progress := 15;

    namafile := dir_simpan + '\tb_export_import.cbT';
    fungsi.savetofile(dm.Q_Exe,
      'select * from tb_export_import where kd_perusahaan=' +
      QuotedStr(dm.kd_perusahaan) + ' and date(tanggal)=' +
      QuotedStr(formatdatetime('yyyy-MM-dd', edt_kirim.Date)) + '', namafile);
    zipp.AddFiles(dir_zip + '\tb_export_import.cbT', 0);
    sg_load.Progress := 16;

    if DirectoryExists(dir_simpan) then
      fungsi.hapusdir(dir_simpan);
    sg_load.Visible := false;

    showmessage('penyimpanan data sukses...');
    pilih_data(dir_simpan + '.zip');
  except
    on E: exception do
    begin
      sg_load.Visible := false;

      if DirectoryExists(dir_simpan) then
        fungsi.hapusdir(dir_simpan);

      MessageDlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + E.Message,
        mtError, [mbOk], 0);
    end;
  end;

  zipp.Free;
end;

procedure TF_kirim_data.FormShow(Sender: TObject);
begin
  pc_1.ActivePage := ts_1;

  edt_kirim.Date := Date();
  edt_terima.Date := Date();
end;

procedure TF_kirim_data.sButton1Click(Sender: TObject);
begin
  cek_dir_terima;
  zv_load.BeginUpdate;

  if FileExists(file_load) then
  begin
    zk_load.FileName := file_load;
    spnl_load.Caption := file_load + '   (' + IntToStr(zv_load.Count) +
      ' Items)';
  end
  else
  begin
    spnl_load.Caption := 'Data untuk Tanggal, ' + formatdatetime('dd mmmm YYYY',
      edt_terima.Date) + ' Tidak Ada';
  end;

  zv_load.EndUpdate;
end;

procedure TF_kirim_data.sButton2Click(Sender: TObject);
begin
  if od_load.Execute then
  begin
    zv_load.BeginUpdate;
    zk_load.FileName := od_load.FileName;
    spnl_load.Caption := zk_load.FileName + '   ' + IntToStr(zv_load.Count)
      + ' items';
    zv_load.EndUpdate;
  end;
end;

procedure TF_kirim_data.sButton3Click(Sender: TObject);
var
  i: Integer;
  uz: TAbUnZipper;
  nm_tabel, nm_file: string;
begin
  cek_dir_terima;
  uz := TAbUnZipper.Create(Self);

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_export_import where kd_perusahaan = "' + dm.kd_perusahaan
    + '" and data = "' + ExtractFileName(zk_load.FileName) +
    '" and ket = "terima"', true);

  if not(dm.Q_temp.Eof) then
  begin
    if (MessageBox(0, 'Data ini Sudah Pernah di load ke dalam data base...' +
      #13 + #10 + 'Apakah ' + 'anda akan meLoad data ini lagi???', 'Load again',
      MB_ICONEXCLAMATION or MB_YESNO) = idNo) then
      Exit;
  end;

  with uz do
  begin
    FileName := zk_load.FileName;
    BaseDirectory := ExtractFilePath(zk_load.FileName);
    ExtractFiles('*.*');
  end;
  uz.Free;

  dm.db_conn.StartTransaction;
  try
    sg_load.Visible := true;
    sg_load.MaxValue := zk_load.Count - 1;
    for i := 0 to zk_load.Count - 1 do
    begin
      nm_file := zk_load.Items[i].FileName;
      Delete(nm_file, 1, Length(zk_load.Items[i].StoredPath));
      nm_tabel := nm_file;
      Delete(nm_tabel, Length(nm_tabel) - 3, 4);

      fungsi.SQLExec(dm.Q_Exe, 'TRUNCATE TABLE ' + nm_tabel + '', false);

      fungsi.amankan(dir_load + nm_file, dir_load + nm_file, 9966);

      fungsi.SQLExec(dm.Q_Exe, 'LOAD DATA LOCAL INFILE "' +
        StringReplace(dir_load + nm_file, '\', '/', [rfReplaceAll]) +
        '" REPLACE INTO ' + 'TABLE ' + nm_tabel +
        ' FIELDS TERMINATED BY ''&'' OPTIONALLY ENCLOSED BY ''#'' LINES ' +
        'STARTING BY ''<'' TERMINATED BY ''>'' ', false);

      fungsi.amankan(dir_load + nm_file, dir_load + nm_file, 9966);

      DeleteFile(dir_load + nm_file);

      sg_load.Progress := i;
    end;

    fungsi.SQLExec(dm.Q_Exe,
      'replace into tb_export_import(kd_perusahaan, data, ket, tanggal) values ("'
      + dm.kd_perusahaan + '","' + ExtractFileName(zk_load.FileName) +
      '","terima",now())', false);

    fungsi.SQLExec(dm.Q_Exe,
      'update tb_company set update_mutasi="YA" where kd_perusahaan="' +
      dm.kd_perusahaan + '"', false);

    dm.db_conn.Commit;

    nm_file := zk_load.FileName;

    zv_load.BeginUpdate;
    zk_load.FileName := '';
    zv_load.EndUpdate;

    if FileExists(nm_file) then
      DeleteFile(nm_file);

    sg_load.Visible := false;
    spnl_load.Caption := '';
    showmessage('load data berhasil...');
  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      sg_load.Visible := false;

      for i := 0 to zk_load.Count - 1 do
      begin
        nm_file := zk_load.Items[i].FileName;
        Delete(nm_file, 1, Length(zk_load.Items[i].StoredPath));
        if FileExists(dir_load + nm_file) then
          DeleteFile(dir_load + nm_file);
      end;

      MessageDlg('proses load data gagal,ulangi lagi!!! '#10#13'' + E.Message,
        mtError, [mbOk], 0);
    end;
  end;
end;

end.
