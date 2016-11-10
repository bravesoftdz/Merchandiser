unit u_stok_opname;

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
  cxData, sDialogs,uTerbilang, DB, cxDBData, cxGridDBTableView, sSpinEdit,
  sGroupBox, mySQLDbTables;

type                                               
  Tf_stok_opname = class(TForm)
    panel4: TsPanel;
    sPanel1: TsPanel;
    panel1: TsPanel;
    Mm_nama: TsMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TsPanel;
    sBevel1: TsBevel;
    sLabel1: TsLabel;
    ed_kodeSO: TsEdit;
    ed_code: TsEdit;
    sSpeedButton18: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    sLabel5: TsLabel;
    BtnAuto: TsButton;
    spnl1: TsPanel;
    BtnCetak: TsButton;
    Sb_cari: TsSpeedButton;
    grid: TcxGrid;
    t_koreksi: TcxGridDBTableView;
    t_koreksiRak: TcxGridDBColumn;
    t_koreksiShelving: TcxGridDBColumn;
    t_koreksiColumn1: TcxGridDBColumn;
    t_koreksikd_barang: TcxGridDBColumn;
    t_koreksibarcode: TcxGridDBColumn;
    t_koreksin_barang: TcxGridDBColumn;
    t_koreksiqty_real: TcxGridDBColumn;
    t_koreksiColumn2: TcxGridDBColumn;
    l_koreksi: TcxGridLevel;
    rg_pilihan: TsRadioGroup;
    BtnTambah: TsButton;
    se_rak: TsDecimalSpinEdit;
    pnl1: TsPanel;
    BtnBaru: TsButton;
    BtnBatal: TsButton;
    BtnKoreksi: TsButton;
    BtnSimpan: TsButton;
    QListData: TmySQLQuery;
    dsDsListData: TDataSource;
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBaruClick(Sender: TObject);
    procedure Sb_cariClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_kodeSOChange(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure BtnAutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_kodeSOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTambahClick(Sender: TObject);
    procedure segarkan;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnKoreksiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_stok_opname: Tf_stok_opname;
  
  sub_sub_total:integer;

implementation

uses u_dm, u_cari, u_utama;

{$R *.dfm}

procedure Tf_stok_opname.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
  if not(metu_kabeh) then
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

procedure Tf_stok_opname.ed_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  kd_brg: string;
begin
  if key=vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
    if ed_code.Text='' then exit;

    fungsi.sqlExec(dm.Q_temp,'SELECT kd_barang from tb_barang where ((kd_barang = "'+
    ed_code.Text+'" OR barcode3 = "'+ed_code.Text+'" OR barcode2 = "'+ed_code.Text+'" OR barcode1 = "'+
    ed_code.Text+'") AND kd_perusahaan="'+F_Utama.sb.Panels[5].Text+'")', true);

    kd_brg:=dm.Q_temp.fieldbyname('kd_barang').AsString;

    if dm.Q_temp.RecordCount=0 then
    begin
      showmessage('data tidak dapat ditemukan dalam daftar barang...');
      ed_code.Clear;
      exit;
    end;

    dm.db_conn.StartTransaction;
    try 
      fungsi.SQLExec(dm.Q_Exe,'INSERT IGNORE INTO tb_koreksi_temp(kd_perusahaan,kd_koreksi, '+
      'Rak,Shelving,urut,kd_barang,barcode,n_barang,qty_oh,harga_pokok) '+
      'SELECT kd_perusahaan,'+quotedstr(ed_kodeSO.Text)+',no_rak,no_shelving,no_urut, '+
      'kd_barang,barcode3,n_barang,stok_OH,hpp_aktif FROM vw_so WHERE '+
      '(kd_perusahaan="'+F_Utama.sb.Panels[5].Text+'" AND kd_barang = "'+
      kd_brg+'")', false);

      dm.db_conn.Commit;
      segarkan;
      ed_code.Clear;
      BtnKoreksi.Enabled := True;
    except on e:exception do
      begin
        dm.db_conn.Rollback;
        showmessage('proses tambah data gagal '#10#13'' +e.Message);
      end;
    end;
  end;

  if key= vk_f2 then sb_cariClick(Sender);

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

procedure Tf_stok_opname.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then ed_code.SetFocus;
  if key=vk_f5 then BtnAutoClick(Sender);
end;

procedure Tf_stok_opname.BtnBaruClick(Sender: TObject);
begin
  BtnAutoClick(Sender);
end;

procedure Tf_stok_opname.Sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  u_cari.tipe_cari:=1;
  u_cari.asal:='f_stok';
  fungsi.SQLExec(dm.q_cari,'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+
    F_Utama.sb.Panels[5].Text+'" limit 50',true);
  f_cari.clm1.caption:='PID';
  f_cari.clm2.caption:='Deskripsi';
  f_cari.ShowModal;
end;

procedure Tf_stok_opname.BtnSimpanClick(Sender: TObject);
begin
  if BtnKoreksi.Enabled = True then
  begin
    ShowMessage('Tidak Dapat menyimpan, Data SO belum dikoreksi, Koreksi Terlebih Dahulu!!!');
    Exit;
  end;

  if messagedlg('Yakinkah Anda akan Menyimpan Data ini???...',mtconfirmation, [mbyes,mbno],0)=mryes then
  begin
    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe,'call sp_simpan_SO("'+f_utama.sb.Panels[5].Text+'","'+
      ed_kodeSO.Text+'","'+f_utama.sb.Panels[3].Text+'")',false);

      showmessage('proses Simpan Stok Opname untuk '#10#13''+ed_kodeSO.Text+' Telah Sukses...');

      dm.db_conn.Commit;
      BtnAutoClick(Self);
      except on E:exception do
      begin
        dm.db_Conn.Rollback;
        messagedlg('proses Simpan Stok Opname gagal,ulangi lagi!!! '#10#13''+e.Message, mterror, [mbOk],0);
      end;
    end;
  end;
end;

procedure Tf_stok_opname.BtnCetakClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,'select * from vw_so_temp where kd_koreksi="'+
  ed_kodeSO.Text+'" AND kd_perusahaan = "'+f_utama.sb.Panels[5].Text+'"',true);

  dm.laporan.LoadFromFile(dm.a_path + 'laporan\p_persiapan_SO.fr3');
  dm.laporan.ShowReport;
end;

procedure Tf_stok_opname.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  f_stok_opname:= nil;
  f_utama.MDIChildDestroyed(Self.Handle);
end;

procedure Tf_stok_opname.ed_kodeSOChange(Sender: TObject);
begin
  fungsi.SQLExec(QListData,'select * from tb_koreksi_temp where kd_koreksi="'+ed_kodeSO.Text+'"',true);
  Self.Caption := 'Stock Opname ' + ed_kodeSO.Text;
  f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] :=Caption;
  BtnKoreksi.Enabled := True;
end;

procedure Tf_stok_opname.sSpeedButton18Click(Sender: TObject);
begin
  close;
end;

procedure Tf_stok_opname.BtnAutoClick(Sender: TObject);
var
  a: integer;
begin
  fungsi.SQLExec(dm.Q_temp,'select MAX(RIGHT(kd_koreksi,4)) + 1 AS ahir from tb_koreksi_temp '+
  'where kd_perusahaan= "'+f_utama.sb.Panels[5].Text+'"',true);

  a := dm.Q_temp.FieldbyName('ahir').AsInteger;

  if a<10      then ed_kodeSO.Text:= 'SP000'+inttostr(a) else
  if a<100     then ed_kodeSO.Text:= 'SO00'+inttostr(a) else
  if a<1000    then ed_kodeSO.Text:= 'SO0'+inttostr(a) else
  if a<10000   then ed_kodeSO.Text:= 'SO'+inttostr(a);

  segarkan;
end;

procedure Tf_stok_opname.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_stok_opname.ed_codeKeyPress(Sender: TObject; var Key: Char);
var
  kode: string;
  tempat: Integer;
begin
  kode:= IntToStr(StrToIntDef(ed_code.Text,0));

 if key=#43 then // tanda + ubah qty real
 begin
  tempat := t_koreksi.DataController.FocusedRowIndex;
  
  delete(kode,pos('+',kode),1);
  ed_code.Clear;
  key:=#0;

  if QListData.RecordCount=0 then Exit;

  if (Length(kode) = 0) then Exit;

  if kode <> QListData.FieldByName('qty_real').AsString then
  begin
    QListData.Edit;
    QListData.FieldByName('qty_real').AsString:= kode;
    QListData.Post;

    t_koreksi.DataController.FocusedRowIndex := tempat;
    BtnKoreksi.Enabled:= True;
  end;

  t_koreksi.DataController.FocusedRowIndex := t_koreksi.DataController.FocusedRowIndex+1;
 end;
end;

procedure Tf_stok_opname.ed_kodeSOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key= vk_return) then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
    BtnAutoClick(Self);
  end;
end;

procedure Tf_stok_opname.BtnTambahClick(Sender: TObject);
var
  semua :string;
begin
  if rg_pilihan.ItemIndex=0 then
  semua:= 'Y' else
  semua:='N';

  dm.db_conn.StartTransaction;
  try
  fungsi.SQLExec(dm.Q_Exe,'call sp_persiapan_SO("'+f_utama.sb.Panels[5].Text+'","'+ed_kodeSO.Text+'","'+semua+'",'+se_rak.Text+')',false);

  dm.db_conn.Commit;
  segarkan;
  showmessage('Proses Tambah data Berhasil...');
  BtnKoreksi.Enabled := True;
  except on e:exception do begin
    dm.db_conn.Rollback;
    showmessage('penyimpanan data gagal '#10#13'' +e.Message);
    end;
  end;
end;

procedure Tf_stok_opname.segarkan;
begin
  fungsi.SQLExec(QListData,'select * from tb_koreksi_temp where kd_koreksi="'+
  ed_kodeSO.Text+'" AND kd_perusahaan = "'+f_utama.sb.Panels[5].Text+'"', true);
end;

procedure Tf_stok_opname.BtnBatalClick(Sender: TObject);
begin
  if messagedlg('Yakinkah Anda Akan membatalkan '#10#13''+ed_kodeSO.Text,mtconfirmation, [mbyes,mbno],0)=mryes then
  begin
    dm.db_conn.StartTransaction;
    try
    fungsi.SQLExec(dm.Q_Exe,'delete from tb_koreksi_temp where kd_koreksi="'+
    ed_kodeSO.Text+'" AND kd_perusahaan = "'+f_utama.sb.Panels[5].Text+'"',false);

    showmessage('proses Pembatalan stok Opname untuk '#10#13''+ed_kodeSO.Text+' Telah Sukses...');

    BtnAutoClick(Self);
    
    dm.db_conn.Commit;
    except on e:exception do begin
      dm.db_conn.Rollback;
      showmessage('pembatalan SO gagal '#10#13'' +e.Message);
      end;
    end;
  end;
end;

procedure Tf_stok_opname.BtnKoreksiClick(Sender: TObject);
var
  lama,baru: integer;
begin
  dm.db_conn.StartTransaction;
  try
  lama:= QListData.RecordCount;

  fungsi.SQLExec(dm.Q_Exe,'call sp_koreksi_data("'+ed_kodeSO.Text+'","'+f_utama.sb.Panels[5].Text+'")',false);
  dm.db_conn.Commit;

  segarkan;
  BtnKoreksi.Enabled := False;
  
  baru:= QListData.RecordCount;

  showmessage(inttostr(lama-baru)+' Item Dari '+inttostr(Lama)+' Item '#10#13'Telah Terkoreksi...');

  except on e:exception do
    begin
      dm.db_conn.Rollback;
      showmessage('koreksi data gagal '#10#13'' +e.Message);
    end;
  end;
end;

end.
