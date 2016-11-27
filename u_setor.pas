unit u_setor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sLabel, sEdit, UFungsi, DB, 
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, Buttons, sBitBtn, frxClass,
  frxDBSet, cxStyles, 
  cxGraphics, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ComCtrls, sGroupBox,
  cxCurrencyEdit, AdvDateTimePicker, sTooledit, ExtCtrls, sPanel, Menus,
  cxCustomData, cxFilter, cxData, StdCtrls, Mask, sMaskEdit;

type
  TF_Setor = class(TForm)
    ds_kasir: TDataSource;
    laporan: TfrxReport;
    setor_kasir: TfrxDBDataset;
    R_detail_setor: TfrxReport;
    Detail_setor: TfrxDBDataset;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    t_datauser: TcxGridDBColumn;
    t_datatanggal: TcxGridDBColumn;
    t_datastatus: TcxGridDBColumn;
    t_datakomp: TcxGridDBColumn;
    t_datan_user: TcxGridDBColumn;
    gb_1: TsGroupBox;
    l_1: TsLabel;
    l_3: TsLabel;
    ed_Kd_kasir: TsEdit;
    ed_set_Real: TsCurrencyEdit;
    b_simpan: TsBitBtn;
    b_cetak: TsBitBtn;
    p1: TsPanel;
    l_5: TsLabel;
    b_refresh: TsBitBtn;
    de_trans: TsDateEdit;
    sLabel1: TsLabel;
    edNama: TsEdit;
    sLabel2: TsLabel;
    edWaktu: TsEdit;
    edIP: TsEdit;
    sLabel3: TsLabel;
    procedure FormShow(Sender: TObject);
    procedure ed_Kd_kasirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_set_RealKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure b_simpanClick(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
    procedure b_refreshClick(Sender: TObject);
    procedure laporanClickObject(view: TfrxView; Button: TMouseButton; Shift:
      TShiftState; var Modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Setor: TF_Setor;

implementation

uses
  u_dm;

{$R *.dfm}

procedure TF_Setor.FormShow(Sender: TObject);
begin

  fungsi.SQLExec(dm.Q_temp,
    'select tanggal from tb_login_kasir where kd_perusahaan="' + dm.kd_perusahaan
    + '" ' + 'and kd_jaga="' + dm.kd_pengguna +
    '"  and `status` = ''online'' order by `status` ASC limit 1', true);
  if dm.Q_temp.Eof then
    de_trans.Date := Date()
  else
    de_trans.Date := dm.Q_temp.FieldByName('tanggal').AsDateTime;

  b_refreshClick(Self);
end;

procedure TF_Setor.ed_Kd_kasirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    fungsi.SQLExec(dm.Q_temp,
      'select * from tb_login_kasir inner join tb_user on ' + 'tb_user.kd_user=tb_login_kasir.user where tb_login_kasir.kd_perusahaan="'
      + dm.kd_perusahaan + '" ' + 'and tb_login_kasir.user="' + ed_kd_kasir.Text
      + '" and tb_login_kasir.kd_jaga="' + dm.kd_pengguna +
      '" and status=''online''', true);
    if dm.Q_temp.Eof then
    begin
      showmessage('Id Kasir ini tidak ada dalam daftar kasir yang belum setor');
      ed_set_real.SetFocus;
      ed_kd_kasir.SetFocus;
    end
    else
    begin
      edNama.Text := dm.Q_temp.fieldbyname('n_user').AsString;
      edWaktu.Text := dm.Q_temp.fieldbyname('tanggal').AsString;
      edIP.Text := dm.Q_temp.fieldbyname('komp').AsString;
      ed_set_real.ReadOnly := false;
      ed_set_real.SetFocus;
      b_simpan.Enabled := true;
    end;
  end;
end;

procedure TF_Setor.ed_set_RealKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    b_simpan.SetFocus;
  end;
end;

procedure TF_Setor.b_simpanClick(Sender: TObject);
begin
  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_exe, 'call sp_setor_kasir("' + dm.kd_perusahaan + '","'
      + ed_Kd_kasir.Text + '","' + dm.kd_pengguna + '")', False);
    dm.db_Conn.Commit;

    fungsi.SQLExec(dm.Q_Exe, 'update tb_login_kasir set jumlah_setor_real="' +
      ed_set_real.Text +
      '", tgl_logout=now(),status=''offline'' where kd_perusahaan="' + dm.kd_perusahaan
      + '" and user="' + ed_kd_kasir.Text + '" and kd_jaga="' + dm.kd_pengguna +
      '" and status="online"', false);

    dm.db_conn.Commit;
    showmessage('penyimpanan data sukses');
    b_refreshClick(Self);
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
end;

procedure TF_Setor.b_cetakClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_laporan,
    'select * from tb_login_kasir inner join tb_user on ' + 'tb_user.kd_user=tb_login_kasir.`user` '
    + 'where status=''offline'' and tanggal >= "' + formatdatetime('yyyy-MM-dd hh:mm:ss',
    de_trans.Date) + '" and tb_login_kasir.kd_jaga="' + dm.kd_pengguna +
    '" and tb_login_kasir.kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  laporan.LoadFromFile(dm.Path + 'laporan\p_setor_kasir.fr3');
  laporan.ShowReport;
end;

procedure TF_Setor.b_refreshClick(Sender: TObject);
begin
  ed_kd_kasir.Clear;
  ed_set_real.Clear;
  ed_set_real.ReadOnly := true;
  B_simpan.Enabled := false;

  fungsi.SQLExec(dm.Q_show, 'SELECT * FROM tb_login_kasir INNER JOIN tb_user ' +
    'ON tb_user.kd_user = tb_login_kasir.`user` WHERE ' + 'tanggal >= "' +
    formatdatetime('yyyy-MM-dd hh:mm:ss', de_trans.Date) + '" AND ' +
    'tb_login_kasir.kd_jaga="' + dm.kd_pengguna + '" AND ' +
    'tb_login_kasir.kd_perusahaan="' + dm.kd_perusahaan + '" ' +
    'ORDER BY tanggal DESC', true);

  if dm.Q_show.Eof then
  begin
    de_trans.SetFocus;
    ed_Kd_kasir.Enabled := False;
    ed_set_Real.Enabled := False;
    b_cetak.Enabled := False;
  end
  else
  begin
    b_cetak.Enabled := True;
    ed_Kd_kasir.Enabled := True;
    ed_set_Real.Enabled := True;
    ed_kd_kasir.SetFocus;
  end;
end;

procedure TF_Setor.laporanClickObject(view: TfrxView; Button: TMouseButton;
  Shift: TShiftState; var Modified: Boolean);
begin
  if view.Name = 'mm_kasir_user' then
  begin
    fungsi.SQLExec(dm.Q_temp, 'select * from tb_login_kasir inner join tb_user '
      + 'on tb_user.kd_user=tb_login_kasir.user ' +
      'where tb_login_kasir.kd_perusahaan="' + dm.kd_perusahaan + '" ' +
      'and tb_login_kasir.user="' + View.TagStr +
      '" and tb_login_kasir.kd_jaga="' + dm.kd_pengguna + '" and tanggal >= "' +
      formatdatetime('yyyy-MM-dd hh:mm:ss', de_trans.Date) + '"', true);

    r_detail_setor.LoadFromFile(dm.Path + 'laporan\p_setor_kasir_detail.fr3');
    r_detail_setor.ShowReport;
  end;
end;

end.

