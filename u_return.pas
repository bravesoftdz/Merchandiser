unit u_return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sTooledit, sEdit, Buttons,
  sSpeedButton, sButton, Mask, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sLabel, ExtCtrls, sPanel, sMemo, cxCustomData,
  cxGraphics, cxDataStorage, cxEdit, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxCurrencyEdit,UFungsi, sBevel, ComCtrls,
  sSkinProvider, cxImageComboBox, cxStyles, cxFilter,
  cxData, sDialogs;

type                                               
  Tf_return = class(TForm)
    panel4: TsPanel;
    sPanel1: TsPanel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    view_total: TcxGridColumn;
    view_harga: TcxGridColumn;
    Level: TcxGridLevel;
    panel1: TsPanel;
    Mm_nama: TsMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TsPanel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    ed_no_faktur: TsEdit;
    ed_tgl: TsDateEdit;
    ed_supplier: TsEdit;
    panel3: TsPanel;
    ed_nilai_faktur: TsCurrencyEdit;
    sSpeedButton18: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    ed_fak_receipt: TsEdit;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sPanel2: TsPanel;
    b_load: TsButton;
    od: TsOpenDialog;
    spnl1: TsPanel;
    b_print: TsButton;
    b_new: TsButton;
    b_simpan: TsButton;
    t_view_barcode: TcxGridColumn;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure bersih;
    procedure tampil_data;
    procedure TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure b_newClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_printClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_no_fakturChange(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure ed_fak_receiptChange(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_return: Tf_return;
  
  sub_sub_total,diskon:integer;
  no_faktur:string;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure Tf_return.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(dm.metu_kabeh) then
begin
  if Assigned(active) then
  begin
    idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
    f_utama.tc_child.Tag := -1;
    f_utama.tc_child.TabIndex := idx;
    f_utama.tc_child.Tag := 0;
  end;
end;
end;

procedure Tf_return.bersih;
begin
ed_supplier.Text:= F_Utama.sb.Panels[8].Text;
ed_tgl.Date:= now();
mm_nama.Clear;
ce_harga.Clear;
ed_no_faktur.Clear;
ed_fak_receipt.Clear;
tableview.DataController.RecordCount:=0;
ed_nilai_faktur.Clear;

b_simpan.Enabled:=true;
end;

procedure Tf_return.tampil_data;
Var h : Integer;
begin
ed_supplier.Text:= dm.Q_list_return.fieldbyname('kd_suplier').AsString;
ed_no_faktur.Text:= dm.Q_list_return.fieldbyname('kd_return').AsString;
ed_fak_receipt.Text:= dm.Q_list_return.fieldbyname('faktur_receipt').AsString;
no_faktur:= dm.Q_list_return.fieldbyname('kd_return').AsString;
ed_tgl.Text:= formatdatetime('dd/MM/yyyy',dm.Q_list_return.fieldbyname('tgl_return').AsDateTime);

fungsi.SQLExec(dm.Q_temp,'select * from tb_return_rinci where kd_perusahaan="'+
dm.Q_list_return.fieldbyname('kd_perusahaan').AsString+'" and kd_return="'+
dm.Q_list_return.fieldbyname('kd_return').AsString+'"',true);

if dm.Q_temp.RecordCount<>0 then
begin
  tableview.DataController.RecordCount:= dm.Q_temp.RecordCount;
  for h:= 0 to dm.Q_temp.RecordCount-1 do
  begin
  TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
  TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_return').AsString);
  TableView.DataController.SetValue(h, 3, dm.Q_temp.fieldbyname('harga_pokok').AsString);
  TableView.DataController.SetValue(h, 4, dm.Q_temp.fieldbyname('diskon').AsString);
  TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode').AsString);
  dm.Q_temp.Next;
  end;
end;

b_simpan.Enabled:=false;
b_print.Enabled:= true;
end;

procedure Tf_return.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
if (Atext <>'') then
ed_nilai_faktur.Value:= AValue;
end;

procedure Tf_return.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if tableview.DataController.RecordCount=0 then
begin
mm_nama.Clear;
ce_harga.Clear;
exit;
end;

try
mm_nama.Text:= AfocusedRecord.Values[1];
ce_harga.Text:= AfocusedRecord.Values[3];
except
end;
end;

procedure Tf_return.b_newClick(Sender: TObject);
begin
bersih;
end;

procedure Tf_return.b_simpanClick(Sender: TObject);
var x: integer;
isi_sql:string;
begin  
if (ed_no_faktur.Color=clblue) then
begin
showmessage('no faktur return ini sudah ada dalam database....');
exit;
end;

if (ed_fak_receipt.Color=clblue) then
begin
showmessage('no faktur receipt ini tidak ada dalam database....');
exit;
end;

if tableview.DataController.RecordCount=0 then
begin
showmessage('Data barang masih kosong...');
exit;
end;

  for x:=0 to tableview.DataController.RecordCount-1 do
  begin
  isi_sql:=isi_sql +'("'+dm.kd_perusahaan+'","'+ed_no_faktur.Text
  +'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+TableView.DataController.GetDisplayText(x,0)+'","'+
  TableView.DataController.GetDisplayText(x,1)+'","'+floattostr(TableView.DataController.GetValue(x,2))+'","'+
  floattostr(TableView.DataController.GetValue(x,4))+'",0,"'+TableView.DataController.GetDisplayText(x,5)+'",date(now())),';
  end;
  delete(isi_sql,length(isi_sql),1);


dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_exe,'insert into tb_return_global(kd_perusahaan,kd_return,tgl_return,'+
'kd_suplier,disk_rp,nilai_faktur,pengguna,faktur_receipt,simpan_pada) values ("'+dm.kd_perusahaan+'","'+ed_no_faktur.Text
+'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+ed_supplier.Text+'",0,"'+ed_nilai_faktur.Text
+'","'+dm.kd_operator+'","'+ed_fak_receipt.Text+'",now())',false);

  fungsi.SQLExec(dm.Q_exe,'insert into tb_return_rinci(kd_perusahaan,kd_return,tgl_return,'+
  'kd_barang,n_barang,qty_return,harga_pokok,diskon,barcode,tgl_simpan) values  '+isi_sql, false);

dm.db_conn.Commit;
showmessage('penyimpanan sukses...');
ed_no_faktur.Color:=clblue;
b_simpan.Enabled:=False;
except
on E:exception do
begin
dm.db_conn.Rollback;
messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
end;
end;

end;

procedure Tf_return.b_printClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_cetak_return where kd_perusahaan="'+
dm.kd_perusahaan+'" and kd_return="'+no_faktur+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_return_rinci.fr3');
dm.laporan.ShowReport;
end;

procedure Tf_return.FormClose(Sender: TObject; var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
Action:=cafree;
f_Return:= nil;
end;

procedure Tf_return.ed_no_fakturChange(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_temp,'select kd_return from tb_return_global where kd_return="'+
ed_no_faktur.Text+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
if not(dm.Q_temp.Eof) then
ed_no_faktur.Color:=clblue
else ed_no_faktur.Color:=clwhite;
end;

procedure Tf_return.sSpeedButton18Click(Sender: TObject);
begin
close;
end;

procedure Tf_return.ed_fak_receiptChange(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_temp,'select kd_receipt from tb_receipt_global where kd_receipt="'+
ed_fak_receipt.Text+'" and kd_perusahaan="'+dm.kd_perusahaan+'"',true);
if dm.Q_temp.Eof then
ed_fak_receipt.Color:=clblue
else ed_fak_receipt.Color:=clwhite;
end;

procedure Tf_return.b_loadClick(Sender: TObject);
var
  F: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
od.InitialDir:= dm.DocPath;
if od.Execute then
begin
  try
  bersih;
  
  fungsi.amankan(od.FileName,od.FileName,159);
  AssignFile(F, od.FileName);
  Reset(F);
  Readln(F, TmpStr);
  ed_no_faktur.Text:=TmpStr;
  Readln(F, TmpStr);
  ed_fak_receipt.Text:=TmpStr;
  Readln(F, TmpStr);
  //ed_pelanggan.Text:=TmpStr;
  Readln(F, TmpStr);
  //L_toko.Caption:=TmpStr;
  Readln(F, TmpStr);
  //ed_tgl.Text:=TmpStr;
  ed_tgl.Date:= now();

  Readln(F, Tmp);
  tableview.DataController.RecordCount:=Tmp;
  for x:=0 to tableview.DataController.RecordCount-1 do
    begin
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 0, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 1, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 2, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 3, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 4, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 5, TmpStr);
    end;
  CloseFile(F);
  tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount);
  fungsi.amankan(od.FileName,od.FileName,159);

  except
  ShowMessage('proses load data gagal...');
  end;
end;

end;

procedure Tf_return.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

end.
