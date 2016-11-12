unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, sToolBar, acCoolBar, sStatusBar, Buttons,
  sSpeedButton, sTrackBar, StdCtrls, sLabel, ExtCtrls, sPanel, sMemo, Menus,
  TeEngine, Series, TeeProcs, Chart, DbChart, ImgList, UFungsi, acAlphaImageList,
  sSplitter, ExtDlgs, sDialogs,inifiles, sEdit, sButton,
  sComboBox,shellapi, sTabControl, DB, mySQLDbTables;

type
  TF_Utama = class(TForm)
    sb: TsStatusBar;
    sCoolBar1: TsPanel;
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
    sSplitter1: TsSplitter;
    PenjualanItemHarian1: TMenuItem;
    spd: TsSavePictureDialog;
    sb_tutup_toko: TsSpeedButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DaftarPelanggan1: TMenuItem;
    DaftarSupplier1: TMenuItem;
    RealCard1: TMenuItem;
    sLabel1: TsLabel;
    ExportImportData1: TMenuItem;
    ReceiptOrderRO1: TMenuItem;
    DaftarRO1: TMenuItem;
    cb_periode: TsComboBox;
    Return1: TMenuItem;
    DaftarReturn1: TMenuItem;
    tc_child: TsTabControl;
    laporanpo: TMenuItem;
    PO1: TMenuItem;
    DaftarPO1: TMenuItem;
    N4: TMenuItem;
    Q_time: TmySQLQuery;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure MDIChildCreated(const childHandle : THandle);
    procedure MDIChildDestroyed(const childHandle : THandle);
    procedure tc_childChange(Sender: TObject);
    procedure panel_auto_width;
    procedure PO1Click(Sender: TObject);
    procedure DaftarPO1Click(Sender: TObject);
    procedure mniDaftarSO1Click(Sender: TObject);
    procedure Barcode1Click(Sender: TObject);
    procedure DaftarRencanaSO1Click(Sender: TObject);
    procedure mniStockOpnameSO2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Utama: TF_Utama;
  
  periode,bulan,tahun : string;

implementation

uses U_Login, u_inventory, u_setor, U_toko, u_dm,acselectskin,
  u_kirim_data, u_lap, u_planogram, u_RO, u_list_receipt, u_return,
  u_list_return, u_list_purchase, u_purchase, u_hari, u_list_SO, u_barcode,
  u_list_so_plan, u_stok_opname;

{$R *.dfm}

procedure Tf_utama.panel_auto_width;
var x: integer;
    y: string;
begin
 for x:=0 to sb.Panels.Count-1 do
 begin
    y:= sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) +30;
 end;
end;

//add a tab for an MDI child
procedure tf_utama.MDIChildCreated(const childHandle : THandle);
begin
  tc_child.Tabs.AddObject(TForm(FindControl(childHandle)).Caption, TObject(childHandle));
  tc_child.TabIndex := -1 + tc_child.Tabs.Count;

  dbc_margin.Visible:= False;
  dbc_mutasi.Visible:= False;
  sSplitter1.Visible:= False;

  if f_utama.MDIChildCount > 1 then
  begin
  tc_child.Visible:=True;
  end;
end;

//remove a tab for this MDI child
procedure tf_utama.MDIChildDestroyed(const childHandle : THandle);
var
  idx: Integer;
begin
  idx := tc_child.Tabs.IndexOfObject(TObject(childHandle));
  tc_child.Tabs.Delete(idx);

  if f_utama.MDIChildCount = 2 then
  tc_child.Visible:=False;

  if f_utama.MDIChildCount = 1 then
  begin
  dbc_margin.Visible:= True;
  dbc_mutasi.Visible:= True;
  sSplitter1.Visible:= True;
  end;
end;

procedure TF_Utama.segarkan;
begin
  periode:= cb_periode.Text;
  bulan:= Copy(periode,6,2);
  tahun:= Copy(periode,1,4);

fungsi.SQLExec(dm.Q_mutasi_toko,'select * from tb_mutasi_bulan where month(tgl)="'+
bulan+'" and year(tgl)="'+tahun+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);

fungsi.SQLExec(dm.Q_gross,'select * from tb_gross_margin where month(tanggal)="'+
bulan+'" and year(tanggal)="'+tahun+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
dbc_margin.RefreshData;
dbc_mutasi.RefreshData;
end;

procedure TF_Utama.sb_inventoryClick(Sender: TObject);
begin
//fungsi.SQLExec(dm.Q_show,'select * from tb_barang order by kd_barang',true);

application.CreateForm(tF_inventory, F_Inventory);
f_inventory.ShowModal;
end;

procedure TF_Utama.sb_tokoClick(Sender: TObject);
begin
application.CreateForm(tF_toko, F_toko);
//segarkan;
f_toko.ShowModal;
end;

procedure TF_Utama.sb_tutup_kasirClick(Sender: TObject);
begin
  if not(dm.HakAkses('tkAdmin', f_utama.sb.Panels[3].Text, f_utama.sb.Panels[5].Text)) then
  begin
    messagedlg('Anda tidak mempunyai hak untuk ' + #13#10 +
      'melanjutkan AKSES ke dalam MENU ini...',mtWarning,[mbOk],0);
    Exit;
  end;

  application.CreateForm(tF_Setor, F_setor);
  f_setor.ShowModal;
end;

procedure TF_Utama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.HakAkses('tkAdmin', f_utama.sb.Panels[3].Text, f_utama.sb.Panels[5].Text) then
  begin
    fungsi.SQLExec(dm.Q_temp,'select tanggal from tb_login_kasir where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" '+
    'and kd_jaga="'+f_utama.sb.Panels[3].Text+'"  and `status` = ''online'' order by `status` ASC limit 1',true);
      if not(dm.Q_temp.Eof) then
        begin
        if (MessageBox(0, 'ADA KASIR YANG BELUM SETOR.....'+#13+#10+''+#13+#10+'Apakah Anda '+
        'akan melakukan setor kasir dahulu?????', 'Setor Kasir', MB_ICONWARNING or MB_YESNO) = idYes) then
         begin
          application.CreateForm(tF_Setor, F_setor);
          f_setor.ShowModal;
          action:=canone;
          Exit;
         end;
        end;

     dm.db_conn.StartTransaction;
     try
            fungsi.SQLExec(dm.Q_exe,'update tb_login_jaga set `mode`="offline" where `user`= "'+
            sb.Panels[3].Text+'" and status="jaga" and kd_perusahaan="'+sb.Panels[5].Text+'"',false);
            dm.db_conn.Commit;
            metu_kabeh:= True;
            Action := caFree;
     except on e:exception do
             begin
              action:=caNone;
              dm.db_conn.Rollback;
              showmessage('perubahan data gagal '#10#13'' +e.Message);
             end;
     end;
  end;
end;

procedure TF_Utama.sb_refreshClick(Sender: TObject);
begin
segarkan;
end;

procedure TF_Utama.PenjualanItemHarian1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_jual_harian where tgl_transaksi=date(now()) and kd_perusahaan="'+sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\p_jual_item_harian.fr3');
dm.laporan.ShowReport;
end;

procedure TF_Utama.DBC_marginDblClick(Sender: TObject);
begin
if spd.Execute then
  dbc_margin.SaveToMetafile(spd.FileName);
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
close;
end;

procedure TF_Utama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f1 then
ShellExecute(Handle,'open', PChar('hh.exe'),PChar(dm.a_path+'tools/bantuan.chm::/POS_Server1.htm'), nil, SW_SHOW);

if (shift=[ssctrl]) and (key=vk_home) then
selectskin(dm.sm);
end;

procedure TF_Utama.DaftarSupplier1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_supp where kd_perusahaan="'+sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path+ 'laporan\p_daftar_supplier.fr3');
dm.laporan.ShowReport;
end;

procedure TF_Utama.DaftarPelanggan1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_pelanggan where kd_perusahaan="'+sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path+ 'laporan\p_daftar_pelanggan.fr3');
dm.laporan.ShowReport;
end;

procedure TF_Utama.FormShow(Sender: TObject);
var x:integer;
begin
  DecimalSeparator:= '.';
  ThousandSeparator := ',';

Application.CreateForm(TF_Login, F_Login);
F_Login.ShowModal;

if dm.Login = False then Close;

sb.Panels[3].Text:=kd_operator;
sb.Panels[4].Text:=n_operator;
sb.Panels[5].Text:=kd_comp;

fungsi.SQLExec(dm.Q_temp,'select * from tb_company where kd_perusahaan = "'+sb.Panels[5].text+'"',true);
sb.Panels[6].Text:=dm.Q_temp.fieldbyname('n_perusahaan').AsString;
sb.Panels[8].Text:=dm.Q_temp.fieldbyname('ket').AsString;

sb.Panels[7].Text:=dm.db_conn.DatabaseName+'@'+dm.db_conn.Host;

if sb.Panels[8].Text='PUSAT' then
begin
  laporanpo.Enabled:= False;
  LaporanTerimaBarang1.Enabled:= False;
  LaporanReturnBarang1.Enabled:= False;
  ExportImportData1.Enabled:= False;
end;

if dm.Q_temp.fieldbyname('onserver').AsString = 'Y' then
begin
  ExportImportData1.Enabled :=False;
end;  

sb.Panels[9].Text:= 'Versi : '+fungsi.GetVersiApp;

panel_auto_width;

fungsi.SQLExec(dm.Q_temp,'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, '+
'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'+
F_Utama.sb.Panels[5].Text+'" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', true);

for x:= 1 to dm.Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;

cb_periode.ItemIndex:= cb_periode.Items.Count-1;
segarkan;

s_mg_jual.DataSource:=dm.Q_gross;
s_mg_laba.DataSource:=dm.Q_gross;

Series2.DataSource:=dm.Q_mutasi_toko;
Series2.DataSource:=dm.Q_mutasi_toko;
Series2.DataSource:=dm.Q_mutasi_toko;
Series2.DataSource:=dm.Q_mutasi_toko;

end;

procedure TF_Utama.cb_periodeChange(Sender: TObject);
begin
segarkan;
end;

procedure TF_Utama.Timer1Timer(Sender: TObject);
var  days: array[1..7] of string;
begin
  days[1] := 'Minggu';
  days[2] := 'Senin';
  days[3] := 'Selasa';
  days[4] := 'Rabu';
  days[5] := 'Kamis';
  days[6] := 'Jumat';
  days[7] := 'Sabtu';

try
fungsi.SQLExec(Q_time,'select now() as sekarang',True);

sb.Panels[0].Text:=days[DayOfWeek(Q_time.fieldbyname('sekarang').AsDateTime)];
sb.Panels[1].Text:=formatdatetime('dd mmm yyyy', Q_time.fieldbyname('sekarang').AsDateTime);
sb.Panels[2].Text:=FormatDateTime('hh:nn:ss',Q_time.fieldbyname('sekarang').AsDateTime);
except
  Timer1.Enabled:= False;
  if (MessageDlg('KONEKSI TERPUTUS DENGAN SERVER...'+#13+#10+'coba '+
  'hubungkan kembali??????', mtWarning, [mbOK], 0) = mrOk) then
  begin
    Timer1.Enabled:= True;
  end;
end;

if sb.Panels[2].Text >= '23:59:00' then
begin
  if f_hari = nil then
  begin
    Application.CreateForm(Tf_hari, f_hari);
    f_hari.ShowModal;
  end;
end else
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
if f_RO = nil then Application.CreateForm(tf_ro,f_ro);
f_ro.show;
f_RO.bersih;
end;

procedure TF_Utama.Return1Click(Sender: TObject);
begin
if f_return = nil then
application.CreateForm(tf_return, f_return);
f_return.Show;
f_return.bersih;
end;

procedure TF_Utama.DaftarRO1Click(Sender: TObject);
begin
if f_list_receipt = nil then
application.CreateForm(tf_list_receipt, f_list_receipt);

f_list_receipt.segarkan;
f_list_receipt.Show;
end;

procedure TF_Utama.DaftarReturn1Click(Sender: TObject);
begin
if f_list_return = nil then
application.CreateForm(tf_list_return, f_list_return);

f_list_return.segarkan;
f_list_return.Show;
end;

procedure TF_Utama.tc_childChange(Sender: TObject);
var
  cHandle: Integer;
  k: Integer;
begin
  cHandle := Integer(tc_child.Tabs.Objects[tc_child.TabIndex]);

  if tc_child.Tag = -1 then Exit;

  for k := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[k].Handle = cHandle then
    begin
      MDIChildren[k].Show;
      Break;
    end;
  end;
end;

procedure TF_Utama.PO1Click(Sender: TObject);
begin
//purchase order
if f_purchase = nil then
application.CreateForm(tf_purchase, f_purchase);
f_purchase.Show;
f_purchase.bersih;
end;

procedure TF_Utama.DaftarPO1Click(Sender: TObject);
begin
//list PO
if f_List_purchase = nil then
application.CreateForm(tf_List_purchase, f_List_purchase);

f_List_purchase.segarkan;
f_List_purchase.Show;
end;

procedure TF_Utama.mniDaftarSO1Click(Sender: TObject);
begin
if f_list_SO = nil then
application.CreateForm(tf_list_SO, f_list_SO);

f_list_SO.segarkan;
f_list_SO.Show;
end;

procedure TF_Utama.Barcode1Click(Sender: TObject);
begin
Application.CreateForm(Tf_barcode, f_barcode);
f_barcode.ShowModal;
end;

procedure TF_Utama.DaftarRencanaSO1Click(Sender: TObject);
begin
if f_list_so_plan = nil then
application.CreateForm(Tf_list_so_plan, f_list_so_plan);

f_list_so_plan.segarkan;
f_list_so_plan.Show;
end;

procedure TF_Utama.mniStockOpnameSO2Click(Sender: TObject);
begin
  //Stock Opname
  application.CreateForm(Tf_stok_opname, f_stok_opname);
  f_stok_opname.Show;
end;

end.

