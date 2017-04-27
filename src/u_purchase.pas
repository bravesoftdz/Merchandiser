unit u_purchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sTooledit, Buttons, sSpeedButton, Mask, sCustomComboEdit,
  sCurrEdit, sCurrencyEdit, ExtCtrls, cxCustomData, cxGraphics, cxDataStorage,
  cxEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxCurrencyEdit, UFungsi,
  ComCtrls, sSkinProvider, cxImageComboBox, cxStyles, sDialogs, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, cxFilter, cxData, sMaskEdit;

type
  Tf_purchase = class(TForm)
    panel4: TPanel;
    sPanel1: TPanel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    t_view_harga: TcxGridColumn;
    Level: TcxGridLevel;
    panel1: TPanel;
    Mm_nama: TMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TPanel;
    sBevel1: TBevel;
    sLabel1: TLabel;
    sLabel3: TLabel;
    sLabel4: TLabel;
    sb_cari: TsSpeedButton;
    ed_no_faktur: TEdit;
    ed_tgl: TsDateEdit;
    ed_supplier: TEdit;
    ed_code: TEdit;
    panel3: TPanel;
    ed_nilai_faktur: TsCurrencyEdit;
    sSpeedButton18: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    b_rekom: TButton;
    sLabel5: TLabel;
    sPanel2: TPanel;
    b_simpan_file: TButton;
    b_load: TButton;
    od: TOpenDialog;
    sd: TSaveDialog;
    b_auto: TButton;
    t_view_total_harga: TcxGridColumn;
    spnl1: TPanel;
    b_new: TButton;
    b_simpan: TButton;
    b_print: TButton;
    stl1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    t_view_barcode: TcxGridColumn;
    procedure bersih;
    procedure tampil_data;
    procedure CreateRows;
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure b_newClick(Sender: TObject);
    procedure sb_cariClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_printClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_no_fakturChange(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure b_rekomClick(Sender: TObject);
    procedure b_simpan_fileClick(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
    procedure TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
      (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure FormCreate(Sender: TObject);
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_purchase: Tf_purchase;

implementation

uses
  u_dm, u_cari, u_utama;

{$R *.dfm}

procedure Tf_purchase.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
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

procedure Tf_purchase.bersih;
begin
  ed_supplier.Text := f_utama.sb.Panels[8].Text;
  ed_tgl.Date := now();
  Mm_nama.Clear;
  ce_harga.Clear;
  ed_no_faktur.Clear;
  TableView.DataController.RecordCount := 0;
  ed_nilai_faktur.Clear;
end;

procedure Tf_purchase.tampil_data;
var
  h: Integer;
  x_hpp: real;
begin
  ed_supplier.Text := dm.Q_list_purchase.fieldbyname('kd_suplier').AsString;
  ed_no_faktur.Text := dm.Q_list_purchase.fieldbyname('kd_purchase').AsString;
  ed_tgl.Text := formatdatetime('dd/MM/yyyy',
    dm.Q_list_purchase.fieldbyname('tgl_purchase').AsDateTime);

  fungsi.SQLExec(dm.Q_temp,
    'select * from tb_purchase_rinci where kd_perusahaan="' +
    dm.Q_list_purchase.fieldbyname('kd_perusahaan').AsString +
    '" and kd_purchase="' + dm.Q_list_purchase.fieldbyname('kd_purchase')
    .AsString + '"', true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    TableView.DataController.RecordCount := dm.Q_temp.RecordCount;
    for h := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(h, 0, dm.Q_temp.fieldbyname('kd_barang')
        .AsString);
      TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang')
        .AsString);
      TableView.DataController.SetValue(h, 2,
        dm.Q_temp.fieldbyname('qty_purchase').AsString);
      TableView.DataController.SetValue(h, 4,
        dm.Q_temp.fieldbyname('harga_pokok').AsString);
      TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode')
        .AsString);
      x_hpp := dm.Q_temp.fieldbyname('harga_pokok').AsFloat /
        dm.Q_temp.fieldbyname('qty_purchase').AsFloat;
      TableView.DataController.SetValue(h, 3, x_hpp);
      dm.Q_temp.Next;
    end;
    TableView.DataController.ChangeFocusedRowIndex
      (TableView.DataController.RecordCount + 1);
  end;
end;

procedure Tf_purchase.CreateRows;
var
  baris_baru: Integer;
  f: Integer;
begin
  if TableView.DataController.RecordCount <> 0 then
  begin
    for f := 0 to TableView.DataController.RecordCount - 1 do
    begin
      if (pos(TableView.DataController.GetValue(f, 0),
        dm.Q_temp.fieldbyname('kd_barang').AsString) > 0) then
      begin
        TableView.DataController.ChangeFocusedRecordIndex(f);
        showmessage('data barang sudah masuk...');
        exit;
      end;
    end;
  end;

  baris_baru := TableView.DataController.RecordCount + 1;
  TableView.DataController.RecordCount := baris_baru;
  TableView.DataController.SetValue(baris_baru - 1, 0,
    dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 1,
    dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 2, 1);
  TableView.DataController.SetValue(baris_baru - 1, 3,
    dm.Q_temp.fieldbyname('hpp_aktif').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 4,
    dm.Q_temp.fieldbyname('hpp_aktif').AsString);
  TableView.DataController.SetValue(baris_baru - 1, 5,
    dm.Q_temp.fieldbyname('barcode3').AsString);
  TableView.DataController.ChangeFocusedRowIndex(baris_baru);
  Mm_nama.Text := TableView.DataController.GetValue(baris_baru - 1, 1);
  ce_harga.Text := TableView.DataController.GetValue(baris_baru - 1, 3);
end;

procedure Tf_purchase.ed_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    if ed_code.Text = '' then
      exit;
    fungsi.SQLExec(dm.Q_temp, 'SELECT kd_barang,n_barang,barcode3, ' +
      'hpp_aktif,kd_sat3 FROM tb_barang WHERE ((kd_barang = "' + ed_code.Text +
      '" OR barcode3 = "' + ed_code.Text + '" OR barcode2 = "' + ed_code.Text +
      '" OR barcode1 = "' + ed_code.Text + '") AND kd_perusahaan="' +
      dm.kd_perusahaan + '")', true);
    if dm.Q_temp.RecordCount <> 0 then
    begin
      CreateRows;
    end
    else
    begin
      showmessage('data tidak dapat ditemukan dalam daftar barang...');
    end;
    ed_code.Clear
  end;

  if (Key = vk_f2) and (sb_cari.Enabled = true) then
    sb_cariClick(Sender);

  if Key = vk_up then
  begin
    if TableView.DataController.FocusedRecordIndex >= 1 then
      TableView.DataController.ChangeFocusedRecordIndex
        (TableView.DataController.FocusedRecordIndex - 1);
    Key := VK_NONAME;

  end;
  if Key = vk_down then
    TableView.DataController.ChangeFocusedRowIndex
      (TableView.DataController.FocusedRowIndex + 1);

  if Key = vk_delete then
    if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
      TableView.DataController.DeleteFocused;
end;

procedure Tf_purchase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    ed_code.SetFocus;
  if Key = vk_f3 then
    Grid.SetFocus;
  if Key = vk_f5 then
    b_autoClick(Sender);
end;

procedure Tf_purchase.b_newClick(Sender: TObject);
begin
  bersih;
end;

procedure Tf_purchase.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with f_cari do
    try
      _SQLi := 'select kd_barang, n_barang from tb_barang ' +
        'where kd_perusahaan="' + dm.kd_perusahaan + '"';
      tblcap[0] := 'Kode';
      tblcap[1] := 'Deskripsi';
      if ShowModal = mrOk then
      begin
        ed_code.Text := TblVal[0];
      end;
    finally
      close;
    end;
end;

procedure Tf_purchase.b_simpanClick(Sender: TObject);
var
  x: Integer;
  isi_sql, kd_faktur, LSQL: string;
begin
  if (ed_supplier.Text = '') or (ed_no_faktur.Text = '') then
  begin
    showmessage('Data Supplier dan no faktur harus di isi terlebih dahulu...');
    exit;
  end;

  if (ed_no_faktur.Color = clblue) then
  begin
    showmessage('no faktur ini sudah ada dalam database....');
    exit;
  end;

  if TableView.DataController.RecordCount = 0 then
  begin
    showmessage('Data barang masih kosong...');
    exit;
  end;

  kd_faktur := ed_no_faktur.Text;

  for x := 0 to TableView.DataController.RecordCount - 1 do
  begin
    isi_sql := isi_sql + Format('("%s", "%s", "%s", "%s", "%d", "%g", "%s", CURDATE()), ',
      [dm.kd_perusahaan, ed_no_faktur.Text, TableView.DataController.GetDisplayText(x, 0),
      TableView.DataController.GetDisplayText(x, 1),Integer(TableView.DataController.GetValue(x, 2)),
      Currency(TableView.DataController.GetValue(x, 4)), TableView.DataController.GetDisplayText(x, 5)]);
  end;
  SetLength(isi_sql, length(isi_sql) - 2);

  dm.db_conn.StartTransaction;
  try
    LSQL := Format('INSERT INTO tb_purchase_global(kd_perusahaan,kd_purchase,tgl_purchase,' +
      'kd_suplier,nilai_faktur,pengguna,simpan_pada) VALUES ("%s", "%s", "%s", "%s", "%g", "%s", NOW())',
      [dm.kd_perusahaan, ed_no_faktur.Text, MyDate(ed_tgl.Date), ed_supplier.Text,
      ed_nilai_faktur.Value, dm.kd_pengguna]);

    fungsi.SQLExec(dm.Q_exe, LSQL, false);

    LSQL := Format('INSERT INTO tb_purchase_rinci(kd_perusahaan,kd_purchase, ' +
      'kd_barang,n_barang,qty_purchase,harga_pokok,barcode,tgl_simpan) VALUES %s',
      [isi_sql]);

    fungsi.SQLExec(dm.Q_exe, LSQL, false);

    dm.db_conn.Commit;

    showmessage('penyimpanan data berhasil...');

    ed_no_faktur.Clear;
    ed_no_faktur.Text := kd_faktur;
    b_print.SetFocus;

  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      MessageDlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + E.Message,
        mterror, [mbOk], 0);
    end;
  end;
end;

procedure Tf_purchase.b_printClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from vw_cetak_purchase where kd_perusahaan="' + dm.kd_perusahaan +
    '" and kd_purchase="' + ed_no_faktur.Text + '"', true);
  dm.laporan.LoadFromFile(dm.Path + 'laporan\gp_purchase_rinci.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_purchase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  f_purchase := nil;
  f_utama.MDIChildDestroyed(Self.Handle);
end;

procedure Tf_purchase.ed_no_fakturChange(Sender: TObject);
var
  urip: Boolean; // jenenge mbahku :-)
begin
  fungsi.SQLExec(dm.Q_temp,
    'select kd_purchase from tb_purchase_global where kd_purchase="' +
    ed_no_faktur.Text + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  if not(dm.Q_temp.Eof) then
  begin
    ed_no_faktur.Color := clblue;
    urip := true;
  end
  else
  begin
    ed_no_faktur.Color := clwhite;
    urip := false;
  end;

  b_auto.Enabled := not(urip);
  sb_cari.Enabled := not(urip);

  b_simpan.Enabled := not(urip);
  b_print.Enabled := urip;
  b_rekom.Enabled := not(urip);

  ed_tgl.ReadOnly := urip;
  ed_code.ReadOnly := urip;
end;

procedure Tf_purchase.sSpeedButton18Click(Sender: TObject);
begin
  close;
end;

procedure Tf_purchase.b_rekomClick(Sender: TObject);
var
  h: Integer;
begin
  if (ed_supplier.Text = '') then
    exit;

  fungsi.SQLExec(dm.Q_temp,
    'select * from vw_purchase_order where kd_perusahaan="' + dm.kd_perusahaan +
    '" and kd_suplier="' + ed_supplier.Text + '" and aktif="Y"', true);

  if dm.Q_temp.RecordCount <> 0 then
  begin
    TableView.DataController.RecordCount := dm.Q_temp.RecordCount;
    for h := 0 to dm.Q_temp.RecordCount - 1 do
    begin
      TableView.DataController.SetValue(h, 0, dm.Q_temp.fieldbyname('kode')
        .AsString);
      TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang')
        .AsString);
      TableView.DataController.SetValue(h, 2,
        dm.Q_temp.fieldbyname('purchase_order').AsString);
      TableView.DataController.SetValue(h, 3,
        dm.Q_temp.fieldbyname('harga_pokok').AsString);
      TableView.DataController.SetValue(h, 4,
        strtofloatdef(dm.Q_temp.fieldbyname('harga_pokok').AsString, 0) *
        strtofloatdef(dm.Q_temp.fieldbyname('purchase_order').AsString, 0));
      TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode')
        .AsString);
      dm.Q_temp.Next;
    end;
  end;
end;

procedure Tf_purchase.b_simpan_fileClick(Sender: TObject);
var
  f: TextFile;
  x: Integer;
begin
  sd.InitialDir := dm.DocPath;
  if sd.Execute then
  begin
    AssignFile(f, sd.FileName);
    Rewrite(f);
    Writeln(f, ed_supplier.Text);
    Writeln(f, ed_no_faktur.Text);
    Writeln(f, ed_tgl.Text);
    Writeln(f, TableView.DataController.RecordCount);
    for x := 0 to TableView.DataController.RecordCount - 1 do
    begin
      Writeln(f, TableView.DataController.GetValue(x, 0));
      Writeln(f, TableView.DataController.GetValue(x, 1));
      Writeln(f, TableView.DataController.GetValue(x, 2));
      Writeln(f, TableView.DataController.GetValue(x, 3));
      Writeln(f, TableView.DataController.GetValue(x, 4));
      Writeln(f, TableView.DataController.GetValue(x, 5));
    end;
    CloseFile(f);
    fungsi.amankan(sd.FileName, sd.FileName, 123);
    bersih;
  end;

end;

procedure Tf_purchase.b_loadClick(Sender: TObject);
var
  f: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
  od.InitialDir := dm.DocPath;
  if od.Execute then
  begin
    try
      fungsi.amankan(od.FileName, od.FileName, 123);
      AssignFile(f, od.FileName);
      Reset(f);
      Readln(f, TmpStr);
      ed_supplier.Text := TmpStr;
      Readln(f, TmpStr);
      ed_no_faktur.Text := TmpStr;
      Readln(f, TmpStr);
      ed_tgl.Text := TmpStr;
      Readln(f, Tmp);
      TableView.DataController.RecordCount := Tmp;
      for x := 0 to TableView.DataController.RecordCount - 1 do
      begin
        Readln(f, TmpStr);
        TableView.DataController.SetValue(x, 0, TmpStr);
        Readln(f, TmpStr);
        TableView.DataController.SetValue(x, 1, TmpStr);
        Readln(f, TmpStr);
        TableView.DataController.SetValue(x, 2, TmpStr);
        Readln(f, TmpStr);
        TableView.DataController.SetValue(x, 3, TmpStr);
        Readln(f, TmpStr);
        TableView.DataController.SetValue(x, 4, TmpStr);
        Readln(f, TmpStr);
        TableView.DataController.SetValue(x, 5, TmpStr);
      end;
      CloseFile(f);

      TableView.DataController.ChangeFocusedRowIndex
        (TableView.DataController.RecordCount);
      Mm_nama.Text := TableView.DataController.GetValue
        (TableView.DataController.RecordCount - 1, 1);
      ce_harga.Text := TableView.DataController.GetValue
        (TableView.DataController.RecordCount - 1, 3);

      fungsi.amankan(od.FileName, od.FileName, 123);
    except
      showmessage('proses load data gagal...');
    end;
  end;
end;

procedure Tf_purchase.b_autoClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp,
    Format('SELECT CONCAT("PO", DATE_FORMAT(NOW(), "%%Y%%m%%d"), ' +
    'LPAD(COUNT(kd_purchase) + 1, 4, "0")) AS new_id FROM tb_purchase_global ' +
    'WHERE DATE(simpan_pada) = DATE(NOW()) AND kd_perusahaan = "%s"',
    [dm.kd_perusahaan]), true);

  ed_no_faktur.Text := dm.Q_temp.fieldbyname('new_id').AsString;
end;

procedure Tf_purchase.
  TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  if (AText <> '') then
    ed_nilai_faktur.Value := AValue
  else
    ed_nilai_faktur.Clear;
end;

procedure Tf_purchase.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(Self.Handle);

  ed_code.Width := panel2.Width - 270;
end;

procedure Tf_purchase.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
  b: Integer;
  harga: real;
begin
  if TableView.DataController.RecordCount = 0 then
    exit;

  harga := TableView.DataController.GetValue
    (TableView.DataController.FocusedRecordIndex, 3);

  kode := ed_code.Text;

  b := TableView.DataController.GetFocusedRecordIndex;

  if Key = #43 then // tanda + (repeat)
  begin
    delete(kode, pos('+', kode), 1);
    ed_code.Clear;
    Key := #0;

    if (StrToIntDef(kode, 0) = 0) or (length(kode) = 0) then
      exit;

    TableView.DataController.SetValue(b, 2, kode); // Qty
    TableView.DataController.SetValue(b, 4, harga * strtofloatdef(kode, 0));
    // total harga
  end;

end;

procedure Tf_purchase.ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) and (b_auto.Enabled = true) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    b_autoClick(Self);
  end;
end;

procedure Tf_purchase.TableViewFocusedRecordChanged
  (Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord
  : TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if TableView.DataController.RecordCount = 0 then
  begin
    Mm_nama.Clear;
    ce_harga.Clear;
    exit;
  end;
  try
    Mm_nama.Text := AFocusedRecord.DisplayTexts[1];
    ce_harga.Value := StrToIntDef(AFocusedRecord.Values[3], 0);
  except
  end;
end;

end.
