unit u_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, sToolBar, acCoolBar, sStatusBar, Buttons,
  sSpeedButton, sTrackBar, StdCtrls, sLabel, ExtCtrls, sPanel, sMemo, Menus,
  TeEngine, Series, TeeProcs, Chart, DbChart, ImgList, U_fungsi, acAlphaImageList,
  sSplitter, ExtDlgs, sDialogs,inifiles, madExceptVcl, sEdit, sButton,
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
    s_mg_today: TBarSeries;
    Series2: TBarSeries;
    s_mg_until: TBarSeries;
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
    MadExceptionHandler1: TMadExceptionHandler;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Utama: TF_Utama;
  fungsi:TFungsi;

implementation

uses U_Login, u_inventory, u_setor, U_toko, u_dm,acselectskin,
  u_kirim_data, u_lap, u_planogram, u_RO, u_list_receipt, u_return,
  u_list_return, u_list_purchase, u_purchase, u_hari, u_list_SO;

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
fungsi.SQLExec(dm.Q_mutasi_toko,'select * from vw_mutasi_toko where periode="'+cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
fungsi.SQLExec(dm.Q_gross,'select * from vw_gross_margin where periode="'+cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
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
application.CreateForm(tF_Setor, F_setor);
f_setor.ShowModal;
end;

procedure TF_Utama.FormClose(Sender: TObject; var Action: TCloseAction);
//var dir_zip,dir_simpan : string;
begin
{
dir_zip:= 'CP_'+f_utama.sb.Panels[5].text+'_'+formatdatetime('yyyy-MM-dd',Date());
dir_simpan:=dm.a_path+'DATA_KIRIM\'+dir_zip;

if  (sb.Panels[8].Text <> 'PUSAT') and (not(FileExists(dir_simpan+'.zip'))) then
begin
  if (MessageDlg('Data utuk hari ini belum disimpan, '+#13+#10+'Data di simpan pada '+
  'waktu tutup toko.'+#13+#10+''+#13+#10+'Apakah data akan di simpan???',
  mtWarning, [mbYes, mbNo], 0) = mrYes) then
  begin
  Application.CreateForm(TF_kirim_data, F_kirim_data);
  F_kirim_data.ShowModal;
  action:=canone;
  exit;
  end;
end;

fungsi.SQLExec(dm.Q_show,'select * from tb_login_kasir where tanggal=date(now()) and status=''online'' and kd_jaga="'+
sb.Panels[3].Text+'" and kd_perusahaan="'+sb.Panels[5].Text+'"',true);

if not(dm.Q_show.Eof) then
begin
showmessage('tidak dapat menutup program karena ada kasir yang belum Setor....');
application.CreateForm(tF_Setor, F_setor);
f_setor.ShowModal;
action:=canone;
exit;
end;

}

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

procedure TF_Utama.sb_refreshClick(Sender: TObject);
begin
segarkan;
end;

procedure TF_Utama.PenjualanItemHarian1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_jual_harian where tgl_transaksi=date(now()) and kd_perusahaan="'+sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\p_jual_item_harian.fr3');
dm.laporan.ShowReport;
//dm.laporan.PreviewPages.SaveToFile(dm.a_path+'jual_item.fp3');
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
  mniLaporanSO.Enabled:= False;
  ExportImportData1.Enabled:= False;
end;

sb.Panels[9].Text:= 'Versi : '+fungsi.program_versi;

panel_auto_width;

fungsi.SQLExec(dm.Q_temp,'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, '+
'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'+
F_Utama.sb.Panels[5].Text+'" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', true);

for x:= 1 to dm.Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;

cb_periode.ItemIndex:= cb_periode.IndexOf(dm.Q_temp.fieldbyname('sekarang').AsString);
segarkan;

s_mg_today.DataSource:=dm.Q_gross;
s_mg_until.DataSource:=dm.Q_gross;

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

end.

