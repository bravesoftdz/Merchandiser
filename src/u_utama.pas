unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, sSpeedButton, StdCtrls, ExtCtrls, Menus, UFungsi,
  ExtDlgs, sDialogs, shellapi, DB, MemDS, DBAccess, MyAccess, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
  VCLTee.TeeGDIPlus;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TF_Utama = class(TForm)
    sb: TStatusBar;
    PnlHeader: TPanel;
    sb_inventory: TsSpeedButton;
    sb_toko: TsSpeedButton;
    sb_laporan: TsSpeedButton;
    sb_tutup_kasir: TsSpeedButton;
    Timer1: TTimer;
    pm_laporan: TPopupMenu;
    Planogram1: TMenuItem;
    LaporanTerimaBarang1: TMenuItem;
    LaporanReturnBarang1: TMenuItem;
    dbc_mutasi: TDBChart;
    DBC_margin: TDBChart;
    s_mg_laba: TBarSeries;
    Series2: TBarSeries;
    s_mg_jual: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    sb_refresh: TsSpeedButton;
    sSplitter1: TSplitter;
    PenjualanItemHarian1: TMenuItem;
    spd: TSavePictureDialog;
    sb_tutup_toko: TsSpeedButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DaftarPelanggan1: TMenuItem;
    DaftarSupplier1: TMenuItem;
    RealCard1: TMenuItem;
    sLabel1: TLabel;
    ExportImportData1: TMenuItem;
    ReceiptOrderRO1: TMenuItem;
    DaftarRO1: TMenuItem;
    cb_periode: TComboBox;
    Return1: TMenuItem;
    DaftarReturn1: TMenuItem;
    tc_child: TTabControl;
    laporanpo: TMenuItem;
    PO1: TMenuItem;
    DaftarPO1: TMenuItem;
    N4: TMenuItem;
    Q_time: TMyQuery;
    mniLaporanSO: TMenuItem;
    mniStockOpnameSO2: TMenuItem;
    mniDaftarSO1: TMenuItem;
    Series1: TBarSeries;
    Barcode1: TMenuItem;
    N5: TMenuItem;
    DaftarRencanaSO1: TMenuItem;
    procedure sb_inventoryClick(Sender: TObject);
    procedure sb_tokoClick(Sender: TObject);
    procedure sb_tutup_kasirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb_refreshClick(Sender: TObject);
    procedure PenjualanItemHarian1Click(Sender: TObject);
    procedure DBC_marginDblClick(Sender: TObject);
    procedure dbc_mutasiDblClick(Sender: TObject);
    procedure Planogram1Click(Sender: TObject);
    procedure sb_tutup_tokoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DaftarSupplier1Click(Sender: TObject);
    procedure DaftarPelanggan1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure segarkan;
    procedure cb_periodeChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ExportImportData1Click(Sender: TObject);
    procedure RealCard1Click(Sender: TObject);
    procedure ReceiptOrderRO1Click(Sender: TObject);
    procedure Return1Click(Sender: TObject);
    procedure DaftarRO1Click(Sender: TObject);
    procedure DaftarReturn1Click(Sender: TObject);
    procedure MDIChildCreated(const childHandle: THandle);
    procedure MDIChildDestroyed(const childHandle: THandle);
    procedure tc_childChange(Sender: TObject);
    procedure panel_auto_width;
    procedure PO1Click(Sender: TObject);
    procedure DaftarPO1Click(Sender: TObject);
    procedure mniDaftarSO1Click(Sender: TObject);
    procedure Barcode1Click(Sender: TObject);
    procedure DaftarRencanaSO1Click(Sender: TObject);
    procedure mniStockOpnameSO2Click(Sender: TObject);
  private
    FVersion: TVersion;
    bulan, tahun, periode: string;
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure cek_update;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Utama: TF_Utama;

implementation

uses
  U_Login, u_inventory, u_setor, U_toko, u_dm, acselectskin, u_kirim_data,
  u_lap,
  u_planogram, u_RO, u_list_receipt, u_return, u_list_return, u_list_purchase,
  u_purchase, u_hari, u_list_SO, u_barcode, u_list_so_plan, u_stok_opname;

{$R *.dfm}

procedure TF_Utama.panel_auto_width;
var
  x: integer;
  y: string;
begin
  for x := 0 to sb.Panels.Count - 1 do
  begin
    y := sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) + 30;
  end;
end;

// add a tab for an MDI child
procedure TF_Utama.MDIChildCreated(const childHandle: THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption,
    TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;

  DBC_margin.Visible := False;
  dbc_mutasi.Visible := False;
  sSplitter1.Visible := False;

  if F_Utama.MDIChildCount > 1 then
  begin
    tc_child.Visible := True;
  end;
end;

// remove a tab for this MDI child
procedure TF_Utama.MDIChildDestroyed(const childHandle: THandle);
var
  idx: integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if F_Utama.MDIChildCount = 2 then
    tc_child.Visible := False;

  if F_Utama.MDIChildCount = 1 then
  begin
    DBC_margin.Visible := True;
    dbc_mutasi.Visible := True;
    sSplitter1.Visible := True;
  end;
end;

procedure TF_Utama.segarkan;
begin
  periode := cb_periode.text;
  bulan := Copy(periode, 6, 2);
  tahun := Copy(periode, 1, 4);

  fungsi.SQLExec(dm.Q_mutasi_toko,
    'select * from tb_mutasi_bulan where month(tgl)="' + bulan +
    '" and year(tgl)="' + tahun + '" and kd_perusahaan="' + dm.kd_perusahaan +
    '"', True);

  fungsi.SQLExec(dm.Q_gross,
    'select tanggal, sales, (sales - hpp) as gm_rp from tb_gross_margin where month(tanggal)="'
    + bulan + '" and year(tanggal)="' + tahun + '" and kd_perusahaan="' +
    dm.kd_perusahaan + '"', True);
  DBC_margin.RefreshData;
  dbc_mutasi.RefreshData;
end;

procedure TF_Utama.WmAfterShow(var Msg: TMessage);
var
  x: integer;
begin
  Application.CreateForm(TF_Login, F_Login);
  F_Login.sb.Panels[0].text := dm.kd_perusahaan;
  F_Login.sb.Panels[1].text := sb.Panels[6].text;
  F_Login.sb.Panels[2].text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  F_Login.ShowModal;

  if dm.Login = False then
    Close;

  sb.Panels[3].text := dm.kd_pengguna;
  sb.Panels[4].text := dm.n_pengguna;
  sb.Panels[5].text := dm.kd_perusahaan;

  fungsi.SQLExec(dm.Q_temp, 'select * from tb_company where kd_perusahaan = "' +
    dm.kd_perusahaan + '"', True);
  sb.Panels[6].text := dm.Q_temp.fieldbyname('n_perusahaan').AsString;
  sb.Panels[8].text := dm.Q_temp.fieldbyname('ket').AsString;

  sb.Panels[7].text := dm.db_conn.Database + '@' + dm.db_conn.Server;

  if sb.Panels[8].text = 'PUSAT' then
  begin
    laporanpo.Visible := False;
    LaporanTerimaBarang1.Visible := False;
    LaporanReturnBarang1.Visible := False;
    ExportImportData1.Visible := False;
  end;

  dm.OnServer := dm.Q_temp.fieldbyname('onserver').AsBoolean;
  if dm.OnServer then
  begin
    ExportImportData1.Visible := False;
    ReceiptOrderRO1.Visible:= False;
    Return1.Visible:= False;
  end;

  panel_auto_width;

  fungsi.SQLExec(dm.Q_temp, 'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, ' +
    'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'
    + dm.kd_perusahaan + '" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', True);

  for x := 1 to dm.Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;

  cb_periode.ItemIndex := cb_periode.Items.Count - 1;
  segarkan;

  s_mg_jual.DataSource := dm.Q_gross;
  s_mg_laba.DataSource := dm.Q_gross;

  Series2.DataSource := dm.Q_mutasi_toko;
  Series2.DataSource := dm.Q_mutasi_toko;
  Series2.DataSource := dm.Q_mutasi_toko;
  Series2.DataSource := dm.Q_mutasi_toko;
end;

procedure TF_Utama.sb_inventoryClick(Sender: TObject);
begin
  // fungsi.SQLExec(dm.Q_show,'select * from tb_barang order by kd_barang',true);

  Application.CreateForm(tF_inventory, F_Inventory);
  F_Inventory.ShowModal;
end;

procedure TF_Utama.sb_tokoClick(Sender: TObject);
begin
  Application.CreateForm(tF_toko, F_toko);
  // segarkan;
  F_toko.ShowModal;
end;

procedure TF_Utama.sb_tutup_kasirClick(Sender: TObject);
begin
  if not(dm.HakAkses('tkAdmin', dm.kd_pengguna, dm.kd_perusahaan)) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...', mtWarning, [mbOk], 0);
    Exit;
  end;

  Application.CreateForm(tF_Setor, F_setor);
  F_setor.ShowModal;
end;

procedure TF_Utama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.HakAkses('tkAdmin', dm.kd_pengguna, dm.kd_perusahaan) then
  begin
    fungsi.SQLExec(dm.Q_temp,
      'select tanggal from tb_login_kasir where kd_perusahaan="' +
      dm.kd_perusahaan + '" ' + 'and kd_jaga="' + dm.kd_pengguna +
      '"  and `status` = ''online'' order by `status` ASC limit 1', True);
    if not(dm.Q_temp.Eof) then
    begin
      if (MessageBox(0, 'ADA KASIR YANG BELUM SETOR.....' + #13 + #10 + '' + #13
        + #10 + 'Apakah Anda ' + 'akan melakukan setor kasir dahulu?????',
        'Setor Kasir', MB_ICONWARNING or MB_YESNO) = idYes) then
      begin
        Application.CreateForm(tF_Setor, F_setor);
        F_setor.ShowModal;
        Action := canone;
        Exit;
      end;
    end;

    FVersion.Free;
    dm.metu_kabeh := True;
    Action := caFree;
  end;
end;

procedure TF_Utama.sb_refreshClick(Sender: TObject);
begin
  segarkan;
end;

procedure TF_Utama.PenjualanItemHarian1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_jual_harian where tgl_transaksi=date(now()) and kd_perusahaan="'
    + dm.kd_perusahaan + '"', True);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\p_jual_item_harian.fr3');
  dm.laporan.ShowReport;
end;

procedure TF_Utama.DBC_marginDblClick(Sender: TObject);
begin
  if spd.Execute then
    DBC_margin.SaveToMetafile(spd.FileName);
end;

procedure TF_Utama.dbc_mutasiDblClick(Sender: TObject);
begin
  if spd.Execute then
    dbc_mutasi.SaveToMetafile(spd.FileName);
end;

procedure TF_Utama.Planogram1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_planogram, f_planogram);
  f_planogram.ShowModal;
end;

procedure TF_Utama.sb_tutup_tokoClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Utama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f1 then
    ShellExecute(Handle, 'open', PChar('hh.exe'),
      PChar(dm.Path + 'tools/bantuan.chm::/POS_Server1.htm'), nil, SW_SHOW);

  if (Shift = [ssctrl]) and (Key = vk_home) then
    selectskin(dm.sm);
end;

procedure TF_Utama.DaftarSupplier1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan, 'select * from tb_supp where kd_perusahaan="' +
    dm.kd_perusahaan + '"', True);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\p_daftar_supplier.fr3');
  dm.laporan.ShowReport;
end;

procedure TF_Utama.DaftarPelanggan1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from tb_pelanggan where kd_perusahaan="' + dm.kd_perusahaan +
    '"', True);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\p_daftar_pelanggan.fr3');
  dm.laporan.ShowReport;
end;

procedure TF_Utama.FormShow(Sender: TObject);
begin
  FVersion := TAppVersion.Create(Application.ExeName);
  cek_update;

  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';
  dm.sm.Active := True;

  sb.Panels[5].text := dm.kd_perusahaan;
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_company where kd_perusahaan = "' +
    dm.kd_perusahaan + '"', True);
  sb.Panels[6].text := dm.Q_temp.fieldbyname('n_perusahaan').AsString;
  sb.Panels[7].text := dm.db_conn.Database + '@' + dm.db_conn.Server;
  sb.Panels[9].text := 'Versi : ' + FVersion.AsString;

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TF_Utama.cb_periodeChange(Sender: TObject);
begin
  segarkan;
end;

procedure TF_Utama.Timer1Timer(Sender: TObject);
var
  days: array [1 .. 7] of string;
begin
  days[1] := 'Minggu';
  days[2] := 'Senin';
  days[3] := 'Selasa';
  days[4] := 'Rabu';
  days[5] := 'Kamis';
  days[6] := 'Jumat';
  days[7] := 'Sabtu';

  try
    fungsi.SQLExec(Q_time, 'select now() as sekarang', True);

    sb.Panels[0].text :=
      days[DayOfWeek(Q_time.fieldbyname('sekarang').AsDateTime)];
    sb.Panels[1].text := formatdatetime('dd mmm yyyy',
      Q_time.fieldbyname('sekarang').AsDateTime);
    sb.Panels[2].text := formatdatetime('hh:nn:ss',
      Q_time.fieldbyname('sekarang').AsDateTime);
  except
    Timer1.Enabled := False;
    if (messagedlg('KONEKSI TERPUTUS DENGAN SERVER...' + #13 + #10 + 'coba ' +
      'hubungkan kembali??????', mtWarning, [mbOk], 0) = mrOk) then
    begin
      Timer1.Enabled := True;
    end;
  end;

  if sb.Panels[2].text >= '23:59:00' then
  begin
    if f_hari = nil then
    begin
      Application.CreateForm(Tf_hari, f_hari);
      f_hari.ShowModal;
    end;
  end
  else
  begin
    if f_hari <> nil then
      f_hari.Close;
  end;
end;

procedure TF_Utama.ExportImportData1Click(Sender: TObject);
begin
  Application.CreateForm(TF_kirim_data, F_kirim_data);
  F_kirim_data.ShowModal;
end;

procedure TF_Utama.RealCard1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_lap, f_lap);
  f_lap.ShowModal;
end;

procedure TF_Utama.ReceiptOrderRO1Click(Sender: TObject);
begin
  if f_RO = nil then
    Application.CreateForm(tf_ro, f_RO);
  f_RO.show;
  f_RO.bersih;
end;

procedure TF_Utama.Return1Click(Sender: TObject);
begin
  if f_return = nil then
    Application.CreateForm(tf_return, f_return);
  f_return.show;
  f_return.bersih;
end;

procedure TF_Utama.DaftarRO1Click(Sender: TObject);
begin
  if f_list_receipt = nil then
    Application.CreateForm(tf_list_receipt, f_list_receipt);

  f_list_receipt.segarkan;
  f_list_receipt.show;
end;

procedure TF_Utama.DaftarReturn1Click(Sender: TObject);
begin
  if f_list_return = nil then
    Application.CreateForm(tf_list_return, f_list_return);

  f_list_return.segarkan;
  f_list_return.show;
end;

procedure TF_Utama.tc_childChange(Sender: TObject);
var
  cHandle: integer;
  k: integer;
begin
  cHandle := integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then
    Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].show;
      Break;
    end;
  end;
end;

procedure TF_Utama.PO1Click(Sender: TObject);
begin
  // purchase order
  if f_purchase = nil then
    Application.CreateForm(tf_purchase, f_purchase);
  f_purchase.show;
  f_purchase.bersih;
end;

procedure TF_Utama.DaftarPO1Click(Sender: TObject);
begin
  // list PO
  if f_List_purchase = nil then
    Application.CreateForm(tf_List_purchase, f_List_purchase);

  f_List_purchase.segarkan;
  f_List_purchase.show;
end;

procedure TF_Utama.mniDaftarSO1Click(Sender: TObject);
begin
  if f_list_SO = nil then
    Application.CreateForm(tf_list_SO, f_list_SO);

  f_list_SO.segarkan;
  f_list_SO.show;
end;

procedure TF_Utama.Barcode1Click(Sender: TObject);
begin
  Application.CreateForm(Tf_barcode, f_barcode);
  f_barcode.ShowModal;
end;

procedure TF_Utama.DaftarRencanaSO1Click(Sender: TObject);
begin
  if f_list_so_plan = nil then
    Application.CreateForm(Tf_list_so_plan, f_list_so_plan);

  f_list_so_plan.segarkan;
  f_list_so_plan.show;
end;

procedure TF_Utama.mniStockOpnameSO2Click(Sender: TObject);
begin
  // Stock Opname
  Application.CreateForm(Tf_stok_opname, f_stok_opname);
  f_stok_opname.show;
end;

procedure TF_Utama.cek_update;
var
  LVersiDB, LVersiAPP: TVersion;
  LSql: string;
begin
  LVersiAPP := FVersion;
  LSql := 'SELECT versi_terbaru FROM app_versi WHERE kode="pos_server.exe"';
  fungsi.SQLExec(dm.Q_Show, LSql, True);
  LVersiDB := TVersion.Create(dm.Q_Show.fieldbyname('versi_terbaru').AsString);

  if CompareVersion(LVersiDB, LVersiAPP) = vHigher then
  begin
    ShowMessage('APLIKASI POS SERVER TIDAK DAPAT DIJALANKAN' + #13#10 +
      'aplikasi terbaru dengan versi : ' + LVersiDB.AsString + #13#10 +
      'SUDAH DIRILIS...');

    Application.Terminate;
  end;
  LVersiDB.Free;
end;

end.
