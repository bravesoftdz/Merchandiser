unit u_inventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sTabControl, DB, StdCtrls, sEdit, Grids, DBGrids,
  Buttons, sBitBtn, sPageControl, sSkinProvider, acProgressBar,
  MySQLMonitor, ExtCtrls, sPanel, sRadioButton, sGroupBox, sListBox,
  sCheckListBox, sButton, sLabel, UFungsi, sUpDown, DBCtrls, Mask,
  frxClass, frxDBSet;

type
  NewControl = class(TControl);
  TF_Inventory = class(TForm)
    pc_inventory: TsPageControl;
    ts_jelajah: TsTabSheet;
    db_barang: TDBGrid;
    ts_detail: TsTabSheet;
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    gb_kondisi: TsGroupBox;
    rb_like: TsRadioButton;
    rb_sama: TsRadioButton;
    rb_lebih: TsRadioButton;
    rb_kurang: TsRadioButton;
    rb_tdk_sama: TsRadioButton;
    gb_saring: TsGroupBox;
    rb_plu: TsRadioButton;
    rb_min_order: TsRadioButton;
    rb_max_stok: TsRadioButton;
    rb_min_stok: TsRadioButton;
    rb_lebih_sama: TsRadioButton;
    rb_kurang_sama: TsRadioButton;
    ts_mutasi: TsTabSheet;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    Ed_golongan: TsEdit;
    sLabel4: TsLabel;
    Ed_Merk: TsEdit;
    Ed_Kategori: TsEdit;
    Ed_Jenis: TsEdit;
    l_aktif: TsLabel;
    sGroupBox1: TsGroupBox;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sGroupBox2: TsGroupBox;
    sLabel6: TsLabel;
    sLabel9: TsLabel;
    sLabel8: TsLabel;
    sLabel7: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sGroupBox3: TsGroupBox;
    sGroupBox4: TsGroupBox;
    ed_sat1: TsEdit;
    ed_sat2: TsEdit;
    ed_sat3: TsEdit;
    sGroupBox5: TsGroupBox;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    Ed_urut: TsEdit;
    Ed_shelving: TsEdit;
    Ed_rak: TsEdit;
    ed_LD: TsEdit;
    sLabel20: TsLabel;
    ed_AB: TsEdit;
    sLabel21: TsLabel;
    ed_KK: TsEdit;
    sLabel22: TsLabel;
    sLabel23: TsLabel;
    ed_DB: TsEdit;
    Ed_min_display: TsEdit;
    sLabel24: TsLabel;
    sGroupBox6: TsGroupBox;
    Ed_Cari: TsEdit;
    L_hasil: TsLabel;
    ed_temp: TsEdit;
    ud_cari: TsUpDown;
    B_Cari: TsButton;
    rb_minO: TsRadioButton;
    rb_minS: TsRadioButton;
    rb_maxS: TsRadioButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    sLabel10: TsLabel;
    sLabel25: TsLabel;
    ed_pid: TsEdit;
    ed_nama: TsEdit;
    ed_pid2: TsEdit;
    ed_nama2: TsEdit;
    ds_mutasi: TDataSource;
    ds_barang: TDataSource;
    ed_trans_ah: TsEdit;
    ed_kirim_ah: TsEdit;
    ed_kosong_ah: TsEdit;
    ed_qty1: TsEdit;
    ed_qty2: TsEdit;
    ed_bar1: TsEdit;
    ed_bar2: TsEdit;
    ed_bar3: TsEdit;
    ed_minstok: TsEdit;
    ed_maxstok: TsEdit;
    ed_minor: TsEdit;
    ed_time: TsEdit;
    db_mutasi: TfrxDBDataset;
    laporan: TfrxReport;
    B_Print: TsButton;
    db_laporan: TfrxDBDataset;
    sButton1: TsButton;
    procedure ubah_detail;
    procedure FormShow(Sender: TObject);
    procedure Ed_CariChange(Sender: TObject);
    procedure rb_pluClick(Sender: TObject);
    procedure B_CariClick(Sender: TObject);
    procedure db_barangTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure rb_minSClick(Sender: TObject);
    procedure ts_detailClickBtn(Sender: TObject);
    procedure ts_mutasiClickBtn(Sender: TObject);
    procedure pc_inventoryChange(Sender: TObject);
    procedure B_PrintClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  private
    procedure DBGridScroll(var Message: TMessage);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Inventory: TF_Inventory;
  fungsi: TFungsi;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_Inventory.DBGridScroll(var Message: TMessage);
var count : short;
begin
if (Message.Msg = WM_MOUSEWHEEL) then
begin
  count:=HIWORD(Message.WParam);
  count:=count div 120;
  db_barang.DataSource.DataSet.MoveBy(-count);
end
else
  NewControl(DB_barang).WndProc(Message);
end;

procedure TF_Inventory.ubah_detail;
begin
ed_pid.Text:= dm.Q_show.FieldByName('kd_barang').AsString;
ed_nama.Text:= dm.Q_show.FieldByName('n_barang').AsString;
ed_pid2.Text:= ed_pid.Text;
ed_nama2.Text:=ed_nama.Text;
ed_qty1.Text:= dm.Q_show.FieldByName('qty1').AsString;
ed_qty2.Text:= dm.Q_show.FieldByName('qty2').AsString;
ed_bar1.Text:= dm.Q_show.FieldByName('barcode1').AsString;
ed_bar2.Text:= dm.Q_show.FieldByName('barcode2').AsString;
ed_bar3.Text:= dm.Q_show.FieldByName('barcode3').AsString;
ed_minstok.Text:= dm.Q_show.FieldByName('minstok').AsString;
ed_maxstok.Text:= dm.Q_show.FieldByName('maxstok').AsString;
ed_minor.Text:= dm.Q_show.FieldByName('minor').AsString;
ed_time.Text:= dm.Q_show.FieldByName('leadtime').AsString;
if dm.Q_show.FieldByName('aktif').AsString='Y' then l_aktif.Caption:= 'AKTIF' else l_aktif.Caption:= 'TIDAK AKTIF';

fungsi.SQLExec(dm.Q_temp,'SELECT tb_golongan.N_golbrg AS N_golbrg, tb_merk.N_merk AS N_merk, '+
'tb_jenis.N_Jenis AS N_Jenis, tb_kategori.n_kategori AS n_kategori, tb_jenis.Kd_Jenis, '+
'tb_barang.kd_barang FROM ((((((tb_barang)) LEFT JOIN tb_jenis ON ((tb_jenis.Kd_Jenis = tb_barang.kd_jenis))) '+
'LEFT JOIN tb_kategori ON ((tb_kategori.tag = tb_barang.kd_kategori))) LEFT JOIN tb_merk ON ((tb_merk.kd_merk = tb_barang.kd_merk))) '+
'LEFT JOIN tb_golongan ON (((tb_golongan.kd_golbrg = tb_barang.kd_golbrg) AND (tb_golongan.kd_jenis = tb_jenis.Kd_Jenis)))) '+
'where kd_barang="'+ed_pid.Text+'"',true);

ed_jenis.Text:= dm.Q_temp.fieldbyname('n_jenis').AsString;
ed_golongan.Text:= dm.Q_temp.fieldbyname('n_golbrg').AsString;
ed_merk.Text:= dm.Q_temp.fieldbyname('n_merk').AsString;
ed_kategori.Text:= dm.Q_temp.fieldbyname('n_kategori').AsString;

fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan where kd_satuan="'+dm.Q_show.fieldbyname('kd_sat1').AsString+'"',true);
ed_sat1.Text:= dm.Q_temp.fieldbyname('n_satuan').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan where kd_satuan="'+dm.Q_show.fieldbyname('kd_sat2').AsString+'"',true);
ed_sat2.Text:= dm.Q_temp.fieldbyname('n_satuan').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan where kd_satuan="'+dm.Q_show.fieldbyname('kd_sat3').AsString+'"',true);
ed_sat3.Text:= dm.Q_temp.fieldbyname('n_satuan').AsString;

fungsi.SQLExec(dm.Q_temp,'select max(beli.tgl) as tgl_beli_ahir, max(jual.tgl) '+
'as tgl_jual_ahir, max(kosong.tgl) as tgl_kosong_ahir from tb_mutasi beli, tb_mutasi jual, tb_mutasi kosong '+
'where beli.kd_barang = "'+ed_pid.Text+'" and beli.stok_receipt > 0 '+
'and jual.kd_barang = "'+ed_pid.Text+'" and jual.stok_sales > 0   '+
'and kosong.kd_barang = "'+ed_pid.Text+'" and kosong.stok_ahir <= 0 ',True);

ed_trans_ah.Text:= dm.Q_temp.FieldByName('tgl_jual_ahir').AsString;
ed_kirim_ah.Text:= dm.Q_temp.FieldByName('tgl_beli_ahir').AsString;
ed_kosong_ah.Text:= dm.Q_temp.FieldByName('tgl_kosong_ahir').AsString;

fungsi.SQLExec(dm.Q_temp,'select * from tb_planogram where kd_barang="'+dm.Q_show.fieldbyname('kd_barang').AsString+'"',true);
ed_rak.Text:= dm.Q_temp.fieldbyname('no_rak').AsString;
ed_shelving.Text:= dm.Q_temp.fieldbyname('no_shelving').AsString;
ed_urut.Text:= dm.Q_temp.fieldbyname('no_urut').AsString;
ed_min_display.Text:= dm.Q_temp.fieldbyname('min_display').AsString;
ed_ld.Text:= dm.Q_temp.fieldbyname('kapasitas').AsString;
ed_kk.Text:= dm.Q_temp.fieldbyname('kk').AsString;
ed_ab.Text:= dm.Q_temp.fieldbyname('ab').AsString;
ed_db.Text:= dm.Q_temp.fieldbyname('db').AsString;

end;

procedure TF_Inventory.FormShow(Sender: TObject);
begin
pc_inventory.ActivePage:= ts_jelajah;
fungsi.SQLExec(dm.Q_show,'select * from tb_barang where kd_perusahaan='+
quotedstr(dm.kd_perusahaan)+'',true);
l_hasil.Caption:= 'Ada '+inttostr(dm.Q_show.RecordCount)+' Item';
end;

procedure TF_Inventory.Ed_CariChange(Sender: TObject);
begin
if rb_plu.Checked and rb_like.Checked then
begin
fungsi.SQLExec(dm.Q_show,'select * from tb_barang where kd_barang like "%'+ed_cari.Text
+'%" or n_barang like "%'+ed_cari.Text+'%" order by kd_barang and kd_perusahaan='+quotedstr(dm.kd_perusahaan)+'',true);

l_hasil.Caption:= 'Ada '+inttostr(dm.Q_show.RecordCount)+' Item';
end;
end;

procedure TF_Inventory.rb_pluClick(Sender: TObject);
begin
  b_cari.Visible:= not (rb_plu.Checked);
  rb_like.Enabled:=rb_plu.Checked;
  rb_sama.Enabled:=not (rb_plu.Checked);
  rb_tdk_sama.Enabled:=not (rb_plu.Checked);
  rb_lebih.Enabled:=not (rb_plu.Checked);
  rb_kurang.Enabled:=not (rb_plu.Checked);
  rb_lebih_sama.Enabled:=not (rb_plu.Checked);
  rb_kurang_sama.Enabled:=not (rb_plu.Checked);
  ed_cari.Text:='';

  rb_minS.Visible:=not (rb_plu.Checked);
  rb_minO.Visible:=not (rb_plu.Checked);
  rb_maxS.Visible:=not (rb_plu.Checked);


if not (rb_plu.Checked) then
begin

  fungsi.SQLExec(dm.Q_show,'select * from tb_barang order by kd_barang',true);

  l_hasil.Caption:= 'Ada '+inttostr(dm.Q_show.RecordCount)+' Item';

  ed_cari.Left:=208;
  ed_cari.Width:= 40;
  ud_cari.Associate:= ed_cari;
  ud_cari.Visible:= true;
  ud_cari.Width:= 40;
  rb_sama.Checked:=true;
end else
begin
  ed_cari.Left:=8;
  ed_cari.Width:= 281;
  rb_like.Checked:= true;
  ud_cari.Visible:=false;
  ud_cari.Associate:= ed_temp;
  ed_cari.SetFocus;
end;

end;

procedure TF_Inventory.B_CariClick(Sender: TObject);
var kategori,kondisi:string;
begin
if rb_min_order.Checked=true then kategori:= 'minor';
if rb_min_stok.Checked=true then kategori:= 'minstok';
if rb_max_stok.Checked=true then kategori:= 'maxstok';

if rb_sama.Checked=true then kondisi:='=';
if rb_tdk_sama.Checked=true then kondisi:='<>';
if rb_lebih.Checked=true then kondisi:='>';
if rb_kurang.Checked=true then kondisi:='<';
if rb_lebih_sama.Checked=true then kondisi:='>=';
if rb_kurang_sama.Checked=true then kondisi:='<=';


fungsi.SQLExec(dm.Q_show,'select * from tb_barang where kd_perusahaan="'+dm.kd_perusahaan+'" and '+kategori+' '+kondisi+' '+ed_cari.Text+' order by kd_barang',true);

l_hasil.Caption:= 'Ada '+inttostr(dm.Q_show.RecordCount)+' Item';
end;

procedure TF_Inventory.db_barangTitleClick(Column: TColumn);
begin
//dm.Q_show.SortFieldNames:=column.FieldName;
end;

procedure TF_Inventory.FormCreate(Sender: TObject);
begin
DB_barang.WindowProc := DBGridScroll;
end;

procedure TF_Inventory.rb_minSClick(Sender: TObject);
var kategori,kondisi,gol:string;
begin
if rb_min_order.Checked=true then kategori:= 'minor';
if rb_min_stok.Checked=true then kategori:= 'minstok';
if rb_max_stok.Checked=true then kategori:= 'maxstok';

if rb_sama.Checked=true then kondisi:='=';
if rb_tdk_sama.Checked=true then kondisi:='<>';
if rb_lebih.Checked=true then kondisi:='>';
if rb_kurang.Checked=true then kondisi:='<';
if rb_lebih_sama.Checked=true then kondisi:='>=';
if rb_kurang_sama.Checked=true then kondisi:='<=';

if rb_minS.Checked=true then gol:= 'minstok';
if rb_maxS.Checked=true then gol:= 'maxstok';
if rb_minO.Checked=true then gol:= 'minor';

fungsi.SQLExec(dm.Q_show,'select * from tb_barang where '+kategori+' '+kondisi+' '+gol+' order by kd_barang',true);

l_hasil.Caption:= 'Ada '+inttostr(dm.Q_show.RecordCount)+' Item';
end;

procedure TF_Inventory.ts_detailClickBtn(Sender: TObject);
begin
ubah_detail;
end;

procedure TF_Inventory.ts_mutasiClickBtn(Sender: TObject);
begin
ed_pid.Text:= dm.Q_show.fieldbyname('kd_barang').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_mutasi WHERE kd_perusahaan="'+dm.kd_perusahaan+'" and MONTH(tb_mutasi.tgl)=MONTH(NOW()) and kd_barang="'+ed_pid.Text+'"',true);
dm.Q_temp.RecNo:=dm.Q_temp.RecordCount;
end;

procedure TF_Inventory.pc_inventoryChange(Sender: TObject);
begin
ed_pid.Text:= dm.Q_show.fieldbyname('kd_barang').AsString;
if pc_inventory.ActivePage=ts_detail then
begin
ubah_detail;
end else
if pc_inventory.ActivePage=ts_mutasi then
begin
fungsi.SQLExec(dm.Q_temp,'select * from tb_mutasi WHERE left(tgl,7)="'+
F_Utama.cb_periode.Text+'" and kd_barang="'+ed_pid.Text+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
dm.Q_temp.RecNo:=dm.Q_temp.RecordCount;
end;

end;

procedure TF_Inventory.B_PrintClick(Sender: TObject);
begin
laporan.LoadFromFile(dm.a_path+ 'laporan\gp_mutasi_brg.fr3');
laporan.ShowReport;
end;

procedure TF_Inventory.sButton1Click(Sender: TObject);
begin
laporan.LoadFromFile(dm.a_path+ 'laporan\p_daftar_barang.fr3');
laporan.ShowReport;
end;

end.
