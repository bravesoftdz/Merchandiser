unit u_SO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, Spin, sButton, Grids, DBGrids, sRadioButton,
  sGauge, Buttons, sSpeedButton, ExtCtrls, sPanel, sEdit, sSpinEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,u_fungsi, sGroupBox, Menus, ComCtrls,
  sStatusBar,SHELLAPI, mySQLDbTables,XPMan;

type
  TF_SO = class(TForm)
    sCoolBar1: TsPanel;
    sb_Persiapan: TsSpeedButton;
    sb_penyesuaian: TsSpeedButton;
    sBitBtn1: TsSpeedButton;
    sb_ahir: TsSpeedButton;
    b_tampil: TsButton;
    se_rak: TsDecimalSpinEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    ed_kd_SO: TsEdit;
    t_datakd_barang: TcxGridDBColumn;
    t_databarcode: TcxGridDBColumn;
    t_datan_barang: TcxGridDBColumn;
    t_dataShelving: TcxGridDBColumn;
    t_dataRak: TcxGridDBColumn;
    rb_pilihan: TsRadioGroup;
    pm_daftar: TPopupMenu;
    p_persiapan: TsPanel;
    p_penyesuaian: TsPanel;
    b_cetak: TsButton;
    ed_kd_koreksi: TsEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    l_koreksi: TcxGridLevel;
    t_koreksi: TcxGridDBTableView;
    t_koreksikd_barang: TcxGridDBColumn;
    t_koreksibarcode: TcxGridDBColumn;
    t_koreksin_barang: TcxGridDBColumn;
    t_koreksiShelving: TcxGridDBColumn;
    t_koreksiRak: TcxGridDBColumn;
    t_koreksiqty_real: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    t_koreksiColumn1: TcxGridDBColumn;
    b_koreksi: TsButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    sb: TsStatusBar;
    Timer1: TTimer;
    b_update: TsButton;
    b_batal: TsButton;
    ED_INPUT: TsEdit;
    sb_cari: TsSpeedButton;
    sb_refresh: TsSpeedButton;
    Q_time: TmySQLQuery;
    edInput: TsEdit;
    t_koreksiColumn2: TcxGridDBColumn;
    btnAuto: TsButton;
    procedure persiapan(mat: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure kode_baru;
    procedure tampil_daftar_SO(Sender: TObject);
    procedure generate_daftar_SO;
    procedure sb_PersiapanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b_tampilClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure rb_pilihanChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure b_koreksiClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure b_updateClick(Sender: TObject);
    procedure sb_ahirClick(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
    procedure b_batalClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_INPUTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure sb_refreshClick(Sender: TObject);
    procedure panel_auto_width;
    procedure t_koreksiEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure edInputKeyPress(Sender: TObject; var Key: Char);
    procedure edInputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAutoClick(Sender: TObject);
    procedure ed_kd_SOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_SO: TF_SO;
  fungsi:tfungsi;

implementation

uses u_dm, U_Login, u_cari, u_hari;

{$R *.dfm}

function SetCueBanner(const Edit: TsEdit; const Placeholder: String): Boolean;
const
  EM_SETCUEBANNER = $1501;
var
  UniStr: WideString;
begin
  UniStr := Placeholder;
  SendMessage(Edit.Handle, EM_SETCUEBANNER, WParam(True),LParam(UniStr));
  Result := GetLastError() = ERROR_SUCCESS;
end;

procedure TF_SO.panel_auto_width;
var x: integer;
    y: string;
begin
 for x:=0 to sb.Panels.Count-1 do
 begin
    y:= sb.Panels[x].text;
    sb.Panels[x].Width := sb.Canvas.TextWidth(y) +30;
 end;
end;


function caridanganti
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

procedure TF_SO.tampil_daftar_SO(Sender: TObject);
var kd_koreksi: string;
begin
persiapan(False);
b_update.Enabled:= True;

p_persiapan.Visible:= false;
p_penyesuaian.Visible:= true;
l_data.Visible:= false;
l_koreksi.Visible:= true;

//setcueBanner(edInput,'Masukkan Angka diikuti tanda + kemudian Enter untuk merubah Quantity...');

  with Sender as TMenuItem do
  begin
    kd_koreksi:= caridanganti(caption,'&','');
    ed_kd_koreksi.Text:= kd_koreksi;
    b_batal.Caption:= '&Batalkan '#10#13''+kd_koreksi;

    fungsi.SQLExec(dm.Q_koreksi,'select * from vw_so_temp where kd_koreksi='+quotedstr(ed_kd_koreksi.text)+'',true);
   end;
end;


procedure TF_SO.generate_daftar_SO;
var
  i : integer;
  mi : TMenuItem;
begin
  fungsi.SQLExec(dm.Q_temp,'select kd_koreksi from tb_koreksi_temp where kd_perusahaan="'+
  sb.Panels[5].Text+'" group by kd_koreksi',true);
  // Daftar SO
  pm_daftar.Items.Clear;
  for i := 0 to dm.Q_temp.RecordCount-1 do
  begin
    mi := TMenuItem.Create(Application);
    mi.Caption := dm.Q_temp.fieldbyname('kd_koreksi').AsString;
    mi.OnClick := tampil_daftar_SO;
    pm_daftar.Items.Add(mi);
    //mi.Free;
    dm.Q_temp.Next;
  end;         
end;

procedure TF_SO.kode_baru;
var tgl,y,y_temp: string;
a,b: integer;
begin
tgl:=formatdatetime('yyyyMMdd', date());

fungsi.SQLExec(dm.Q_temp,'select kd_koreksi from tb_koreksi_global '+
  'where tgl_koreksi = date(now()) and kd_perusahaan= "'+sb.Panels[5].Text+'" UNION '+
  'select distinct kd_koreksi from tb_koreksi_temp '+
  'where kd_perusahaan= "'+sb.Panels[5].Text+'" '+
  'order by kd_koreksi',true);

  dm.Q_temp.First;

  for a:=1 to 10000 do
  begin
  if a<10      then y:= 'SO-'+tgl+'-000' else
  if a<100     then y:= 'SO-'+tgl+'-00' else
  if a<1000    then y:= 'SO-'+tgl+'-0'else
  if a<10000   then y:= 'SO-'+tgl+'-';

  y_temp:= y+inttostr(a);

  if dm.Q_temp.fieldbyname('kd_koreksi').AsString=y_temp then
  dm.Q_temp.Next else break;
  end;

  ed_kd_SO.Text:=y_temp;
  fungsi.SQLExec(dm.Q_show,'select * from tb_koreksi_temp where kd_koreksi="'+ed_kd_SO.Text+'"',true);

end;

procedure TF_SO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:= cafree;
try
fungsi.SQLExec(dm.Q_exe,'update tb_login_jaga set mode="offline" where user= "'+
sb.Panels[3].Text+'" and status="SO" and kd_perusahaan="'+sb.Panels[5].Text+'"',false);
dm.db_conn.Commit;
application.Terminate;
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('perubahan data gagal '#10#13'' +e.Message);
  end;
end;
end;

procedure TF_SO.sb_PersiapanClick(Sender: TObject);
begin
kode_baru;
generate_daftar_SO;
p_persiapan.Visible:= true;
p_penyesuaian.Visible:= false;
l_data.Visible:= true;
l_koreksi.Visible:= false;
sb_ahir.Enabled:= false;
ed_input.SetFocus;
end;

procedure TF_SO.FormShow(Sender: TObject);
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
sb.Panels[9].Text:= 'Versi: '+fungsi.program_versi;

panel_auto_width;
setcueBanner(edInput,'Masukkan Angka di ikuti tanda + kemudian Enter untuk merubah Quantity...');
sb_PersiapanClick(Sender);
end;

procedure TF_SO.b_tampilClick(Sender: TObject);
var semua :string;
begin
dm.db_conn.StartTransaction;
try
if rb_pilihan.ItemIndex=0 then
semua:= 'Y' else
begin
semua:='N';
end;

fungsi.SQLExec(dm.Q_Exe,'call sp_persiapan_SO("'+sb.Panels[5].Text+'","'+ed_kd_SO.Text+'","'+semua+'",'+se_rak.Text+')',false);

if dm.Q_show.Eof then generate_daftar_SO;
fungsi.SQLExec(dm.Q_show,'select * from tb_koreksi_temp where kd_koreksi="'+ed_kd_SO.Text+'"', true);

dm.db_conn.Commit;
showmessage('Proses Tambah data Berhasil...');
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;

end;

procedure TF_SO.sBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TF_SO.rb_pilihanChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
if newIndex=1 then se_rak.Visible:=true else se_rak.Visible:=false;
end;

procedure TF_SO.b_koreksiClick(Sender: TObject);
var lama,baru: integer;
begin
dm.db_conn.StartTransaction;
try

lama:= dm.Q_koreksi.RecordCount;
fungsi.SQLExec(dm.Q_Exe,'call sp_koreksi_data("'+ed_kd_koreksi.Text+'","'+sb.Panels[5].Text+'")',false);
dm.db_conn.Commit;

fungsi.SQLExec(dm.Q_koreksi,'select * from vw_so_temp where kd_koreksi='+quotedstr(ed_kd_koreksi.text)+'',true);

baru:= dm.Q_koreksi.RecordCount;

b_koreksi.Enabled:= False;
sb_ahir.Enabled:= True;

showmessage(inttostr(lama-baru)+' Item Dari '+inttostr(Lama)+' Item '#10#13'Telah Terkoreksi...');

if (lama - baru)=lama then
  sb_PersiapanClick(Sender);
  
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('koreksi data gagal '#10#13'' +e.Message);
  end;
end;
end;

procedure TF_SO.Timer1Timer(Sender: TObject);
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

procedure TF_SO.b_updateClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_exe,'call sp_mutasi_repair("'+sb.Panels[5].Text+'",date(now()))',false);

fungsi.SQLExec(dm.Q_Exe,'UPDATE tb_koreksi_temp,tb_barang SET '+
'tb_koreksi_temp.qty_oh=tb_barang.stok_OH '+
'WHERE tb_koreksi_temp.kd_barang=tb_barang.kd_barang AND tb_barang.kd_perusahaan="'+
sb.Panels[5].Text+'" AND tb_barang.kd_perusahaan=tb_koreksi_temp.kd_perusahaan',false);

fungsi.SQLExec(dm.Q_koreksi,'select * from vw_so_temp where kd_koreksi='+quotedstr(ed_kd_koreksi.text)+'',true);

b_update.Enabled := False;
b_koreksi.Enabled := True;

dm.db_conn.Commit;
showmessage('proses update stok OH Sukses...');
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('update stock OH gagal '#10#13'' +e.Message);
  end;
end;
end;

procedure TF_SO.sb_ahirClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
if messagedlg('Yakinkah Anda akan melakukan Adjustment???...',mtconfirmation, [mbyes,mbno],0)=mryes then
begin
try
fungsi.SQLExec(dm.Q_Exe,'call sp_adjustment_SO("'+sb.Panels[5].Text+'","'+ed_kd_koreksi.Text+'","'+sb.Panels[3].Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false);

showmessage('proses Adjustment stok Opname untuk '#10#13''+ed_kd_koreksi.Text+' Telah Sukses...');

dm.db_conn.Commit;

fungsi.SQLExec(dm.Q_laporan,'select * from vw_cetak_koreksi where kd_perusahaan="'+
sb.Panels[5].Text+'" and kd_koreksi="'+ed_kd_koreksi.Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_koreksi_rinci.fr3');
dm.laporan.ShowReport;

sb_PersiapanClick(Sender);
except on E:exception do
begin
dm.db_Conn.Rollback;
messagedlg('proses Adjustment stok Opname gagal,ulangi lagi!!! '#10#13''+e.Message, mterror, [mbOk],0);
end;
end;
end;
end;

procedure TF_SO.b_cetakClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_so_temp where kd_koreksi="'+ed_kd_koreksi.Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\p_persiapan_SO.fr3');
dm.laporan.ShowReport;
end;

procedure TF_SO.b_batalClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
if messagedlg('Yakinkah Anda Akan membatalkan '#10#13''+ed_kd_koreksi.Text,mtconfirmation, [mbyes,mbno],0)=mryes then
begin
try
fungsi.SQLExec(dm.Q_Exe,'delete from tb_koreksi_temp where kd_koreksi="'+ed_kd_koreksi.Text+'"',false);

showmessage('proses Pembatalan stok Opname untuk '#10#13''+ed_kd_koreksi.Text+' Telah Sukses...');

sb_PersiapanClick(Sender);

dm.db_conn.Commit;
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('pembatalan SO gagal '#10#13'' +e.Message);
  end;
end;
end;
end;

procedure TF_SO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_F1 THEN
ShellExecute(Handle,'open', PChar('hh.exe'),PChar(dm.a_path+'tools/bantuan.chm::/Stock_Opname_(SO).htm'), nil, SW_SHOW);

if key=vk_F2 THEN sb_cariClick(Self);

if (Shift=[ssctrl]) and (Key= vk_delete) then
if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
t_koreksi.DataController.DeleteFocused;
end;

procedure TF_SO.ED_INPUTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var kd_brg: string;
begin
if key=vk_return then
begin
  PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  if ed_input.Text='' then exit;

  fungsi.sqlExec(dm.Q_temp,'SELECT kd_barang from tb_barang where ((kd_barang = "'+
  ed_input.Text+'" OR barcode3 = "'+ed_input.Text+'" OR barcode2 = "'+ed_input.Text+'" OR barcode1 = "'+
  ed_input.Text+'") AND kd_perusahaan="'+sb.Panels[5].Text+'")', true);

  kd_brg:=dm.Q_temp.fieldbyname('kd_barang').AsString;

  if dm.Q_temp.RecordCount=0 then
   begin
   showmessage('data tidak dapat ditemukan dalam daftar barang...');
   ed_input.Clear;
   exit;
   end;

  dm.db_conn.StartTransaction;
  try 
  fungsi.SQLExec(dm.Q_Exe,'INSERT IGNORE INTO tb_koreksi_temp(kd_perusahaan,kd_koreksi, '+
  'Rak,Shelving,urut,kd_barang,barcode,n_barang,qty_oh,harga_pokok) '+
  'SELECT kd_perusahaan,'+quotedstr(ed_kd_so.Text)+',no_rak,no_shelving,no_urut, '+
  'kd_barang,barcode3,n_barang,0,hpp_aktif FROM vw_so WHERE '+
  '(kd_perusahaan='+quotedstr(sb.Panels[5].Text)+' AND (kd_barang = "'+
  kd_brg+'"))', false);

  if dm.Q_show.Eof then generate_daftar_SO;
  fungsi.SQLExec(dm.Q_show,'select * from tb_koreksi_temp where kd_koreksi="'+ed_kd_SO.Text+'"', true);

  dm.db_conn.Commit;
  t_data.DataController.ChangeFocusedRecordIndex(
  t_data.DataController.FindRecordIndexByText(1,3,kd_brg,true,true,true));
  ed_input.Clear;
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('proses tambah data gagal '#10#13'' +e.Message);
  end;
end;
end;
end;

procedure TF_SO.sb_cariClick(Sender: TObject);
begin
ed_input.SetFocus;
application.CreateForm(tf_cari, f_cari);
u_cari.tipe_cari:=1;
u_cari.asal:='f_SO';
fungsi.SQLExec(dm.q_cari,'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+sb.Panels[5].Text+'"',true);
f_cari.clm1.caption:='PID';
f_cari.clm2.caption:='Deskripsi';
f_cari.ShowModal;
end;

procedure TF_SO.sb_refreshClick(Sender: TObject);
begin
generate_daftar_SO;
end;


procedure TF_SO.persiapan(mat: Boolean);
begin
sb_ahir.Enabled:= mat;
b_koreksi.Enabled:= mat;
end;

procedure TF_SO.t_koreksiEditValueChanged(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem);
begin
b_koreksi.Enabled:= True;
sb_ahir.Enabled:= False;
end;


procedure TF_SO.edInputKeyPress(Sender: TObject; var Key: Char);
var kode: string;
    tambah, tempat: Integer;
begin
kode:= edInput.Text;

 if key=#43 then // tanda + ubah qty real
 begin
  tempat := t_koreksi.DataController.FocusedRowIndex;
  
  delete(kode,pos('+',kode),1);
  edInput.Clear;
  key:=#0;

  if dm.Q_koreksi.RecordCount=0 then Exit;

  if (Length(kode) =0) then Exit;
  if (StrToIntDef(kode,0) = 0) then kode:='0';

  if kode <> dm.Q_koreksi.FieldByName('qty_real').AsString then
  begin
    dm.Q_koreksi.Edit;
    dm.Q_koreksi.FieldByName('qty_real').AsString:= kode;
    dm.Q_koreksi.Post;

    t_koreksi.DataController.FocusedRowIndex := tempat;

    if b_update.Enabled = False then
    b_koreksi.Enabled:= True; 

  end;
    t_koreksi.DataController.FocusedRowIndex:=    t_koreksi.DataController.FocusedRowIndex+1;
 end;

end;

procedure TF_SO.edInputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if key= vk_up then
begin
  if t_koreksi.DataController.FocusedRowIndex >=1 then
     t_koreksi.DataController.FocusedRowIndex:=
     t_koreksi.DataController.FocusedRowIndex-1;
  key:=VK_NONAME;
end;

if (key= vk_down) or (Key= Vk_return) then
begin
  PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  t_koreksi.DataController.FocusedRowIndex:=
  t_koreksi.DataController.FocusedRowIndex+1;
end;
end;

procedure TF_SO.btnAutoClick(Sender: TObject);
begin
kode_baru;
end;

procedure TF_SO.ed_kd_SOChange(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_show,'select * from tb_koreksi_temp where kd_koreksi="'+ed_kd_SO.Text+'"', true);
end;

end.


