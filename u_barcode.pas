unit u_barcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sButton,
  sLabel, UFungsi, ComCtrls, sEdit, 
  sSkinProvider, Buttons, sSpeedButton, Menus, 
  cxStyles, cxCustomData, cxGraphics, 
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, frxClass,
  cxFilter, cxData, StdCtrls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator;

type
  Tf_Barcode = class(TForm)
    ed_PID: TsEdit;
    btnBarcode: TsButton;
    sSkinProvider1: TsSkinProvider;
    sb_cari: TsSpeedButton;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_harga: TcxGridColumn;
    Level: TcxGridLevel;
    ableViewColumn3: TcxGridColumn;
    UDLaporan: TfrxUserDataSet;
    laporan: TfrxReport;
    l_4: TsLabel;
    procedure createRows;
    procedure ed_PIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBarcodeClick(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_PIDKeyPress(Sender: TObject; var Key: Char);
    procedure laporanGetValue(const VarName: string; var Value: Variant);
    procedure
      TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText(Sender:
      TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
  private
    { Private declarations }
    jumlahLabel, baris, hitung: Integer;
  public
    { Public declarations }
  end;

var
  f_Barcode: Tf_Barcode;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure Tf_Barcode.createRows;
var
  baris_baru: integer;
  f: integer;
begin
  if tableview.DataController.RecordCount <> 0 then
  begin
    for f := 0 to tableview.DataController.RecordCount - 1 do
    begin
      if (pos(TableView.DataController.GetValue(f, 0), dm.Q_temp.fieldbyname('kd_barang').AsString)
        > 0) then
      begin
        tableview.DataController.ChangeFocusedRecordIndex(f);
        TableView.DataController.SetValue(f, 3, TableView.DataController.GetValue
          (f, 3) + 1);
        exit;
      end;
    end;
  end;

  baris_baru := tableview.DataController.RecordCount + 1;
  tableview.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, dm.Q_temp.fieldbyname('harga_jual3').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 3, 1);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);

  if TableView.DataController.RecordCount <> 0 then
    btnBarcode.Enabled := True;
end;

procedure Tf_Barcode.ed_PIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    sb_cari.Click;

  if key = vk_return then
  begin
    if ed_PID.Text = '' then
      Exit;

    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);

    fungsi.SQLExec(dm.Q_temp,
      ' SELECT tb_barang.kd_barang, tb_barang.n_barang, ' + 'tb_barang_harga.harga_jual3 FROM tb_barang '
      + 'INNER JOIN tb_barang_harga ON tb_barang.kd_barang=tb_barang_harga.kd_barang  '
      + 'AND tb_barang_harga.kd_perusahaan = tb_barang.kd_perusahaan ' +
      'WHERE tb_barang.kd_barang = "' + ed_PID.Text + '" AND ' +
      'tb_barang_harga.kd_macam_harga = "HETK" AND tb_barang.aktif="Y" AND ' +
      'tb_barang.kd_perusahaan= "' + dm.kd_perusahaan + '"', true);

    if dm.Q_temp.Eof then
      showmessage('data tidak ada...')
    else
      createRows;

    ed_PID.Clear;
  end;

  if key = vk_up then
  begin
    if tableview.DataController.FocusedRecordIndex >= 1 then
      tableview.DataController.FocusedRecordIndex := tableview.DataController.FocusedRecordIndex
        - 1;
    key := VK_NONAME;

  end;
  if key = vk_down then
    tableview.DataController.FocusedRowIndex := tableview.DataController.FocusedRowIndex
      + 1;

end;

procedure Tf_Barcode.btnBarcodeClick(Sender: TObject);
begin
  UDLaporan.RangeEnd := reCount;
  UDLaporan.RangeEndCount := jumlahLabel;
  baris := 0;
  hitung := 0;

  laporan.LoadFromFile(dm.Path + '\laporan\gp_barcode.fr3');
  laporan.ShowReport;
end;

procedure Tf_Barcode.sb_cariClick(Sender: TObject);
begin
  ed_PID.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_barang, n_barang from tb_barang ' +
      'where kd_perusahaan="' + dm.kd_perusahaan + '"';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Deskripsi';
    if ShowModal = mrOk then
    begin
      ed_PID.Text := TblVal[0];
    end;
  finally
    close;
  end;
end;

procedure Tf_Barcode.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_f2 then
    ed_PID.SetFocus;

  if (Shift = [ssctrl]) and (Key = vk_delete) then
    if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
      TableView.DataController.DeleteFocused;

  if (Shift = [ssShift]) and (Key = vk_delete) then
    if (MessageDlg('Yakinkah, Anda akan menghapus Seluruh Data???',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      TableView.DataController.RecordCount := 0;
end;

procedure Tf_Barcode.ed_PIDKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
  b: Integer;
begin
  if TableView.DataController.RecordCount = 0 then
    Exit;

  kode := ed_PID.Text;

  b := TableView.DataController.GetFocusedRecordIndex;

  if key = #43 then // tanda + (repeat)
  begin
    delete(kode, pos('+', kode), 1);
    ed_PID.Clear;
    key := #0;

    if (StrToIntDef(kode, 0) = 0) or (Length(kode) = 0) then
      Exit;

    TableView.DataController.SetValue(b, 3, kode); //Qty

    if TableView.DataController.RecordCount = 0 then
      btnBarcode.Enabled := False;
  end;
end;

procedure Tf_Barcode.laporanGetValue(const VarName: string; var Value: Variant);
begin
  if (hitung = TableView.DataController.GetValue(baris, 3) * 4) then
  begin
    baris := baris + 1;
    hitung := 0;
  end;

  if CompareText(VarName, '<kd_barang>') = 0 then
    Value := TableView.DataController.GetValue(baris, 0);
  if CompareText(VarName, 'kd_barang') = 0 then
    Value := TableView.DataController.GetValue(baris, 0);
  if CompareText(VarName, 'n_barang') = 0 then
    Value := TableView.DataController.GetValue(baris, 1);
  if CompareText(VarName, 'harga_jual3') = 0 then
    Value := TableView.DataController.GetValue(baris, 2);

  if (hitung < (TableView.DataController.GetValue(baris, 3) * 4)) then
    hitung := hitung + 1;
end;

procedure Tf_Barcode.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
  AText: string);
begin
  jumlahLabel := StrToIntDef(AText, 0);
end;

end.

