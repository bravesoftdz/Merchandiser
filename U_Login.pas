unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  ComCtrls, acProgressBar, sButton, sGauge, UFungsi, sGroupBox, sEdit, Buttons,
  sBitBtn, sRichEdit, sRadioButton, sStatusBar, inifiles;

type
  TF_Login = class(TForm)
    sg_login: TsGroupBox;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    ed_kd_op: TsEdit;
    ed_n_op: TsEdit;
    ed_pass: TsEdit;
    b_login: TsButton;
    sButton1: TsButton;
    sButton2: TsButton;
    sb: TsStatusBar;
    l_1: TsLabel;
    procedure simpanKodePerusahaan;
    procedure cek_update;
    procedure FormShow(Sender: TObject);
    procedure ed_kd_opKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_n_opEnter(Sender: TObject);
    procedure b_loginClick(Sender: TObject);
    procedure ed_kd_opChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_passKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;
  status, userPassword, userRealName: string;

implementation

uses
  u_dm, u_utama, u_cari;

{$R *.dfm}

procedure TF_Login.FormShow(Sender: TObject);
begin
  dm.Login := False;
  sb.Panels[0].Text := dm.kd_perusahaan;
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_company where kd_perusahaan = "' +
    dm.kd_perusahaan + '"', true);
  sb.Panels[1].Text := dm.Q_temp.fieldbyname('n_perusahaan').AsString;

  sb.Panels[2].Text := dm.db_conn.DatabaseName + '@' + dm.db_conn.Host;
end;

procedure TF_Login.ed_kd_opKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sql: string;
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sql := 'SELECT tb_user.n_user, tb_user.`password` FROM tb_user INNER JOIN '
      + 'tb_user_company ON tb_user.kd_user = tb_user_company.kd_user WHERE ' +
      'tb_user.kd_user="' + ed_kd_op.Text + '" AND tb_user_company.toko="Y" ' +
      'AND tb_user_company.kd_perusahaan="' + dm.kd_perusahaan + '"';
    fungsi.SQLExec(DM.Q_Show, sql, true);
    if dm.Q_show.Eof then
    begin
      messagedlg('Kode ini tidak terdaftar...', mtError, [mbOk], 0);
      ed_kd_op.SetFocus;
    end
    else
    begin
      userPassword := dm.Q_show.FieldByName('password').AsString;
      userRealName := dm.Q_show.fieldbyname('n_user').AsString;

      sql := 'SELECT `nilai` FROM `tb_settings` WHERE `parameter`="checkin"';
      fungsi.SQLExec(DM.Q_Show, sql, true);
      if dm.Q_show.FieldByName('nilai').AsBoolean then
      begin
        sql := 'SELECT user_id FROM tb_checkinout WHERE ISNULL(checkout_time) '
          + 'AND user_id="' + ed_kd_op.Text + '"';
        fungsi.SQLExec(DM.Q_Show, sql, true);
        if dm.Q_show.Eof then
        begin
          messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',
            mtError, [mbOk], 0);
          ed_kd_op.SetFocus;
          Exit;
        end;
      end;

      ed_pass.Enabled := true;
      Ed_Pass.SetFocus;
      Ed_N_op.Text := userRealName;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TF_Login.ed_n_opEnter(Sender: TObject);
begin
  ed_kd_op.SetFocus;
end;

procedure TF_Login.b_loginClick(Sender: TObject);
var
  passs: string;
  Host, IP, Err, ip_kasir: string;
begin
  if fungsi.GetIPFromHost(Host, IP, Err) then
    ip_kasir := IP
  else
    MessageDlg(Err, mtError, [mbOk], 0);

  dm.db_conn.StartTransaction;
  try
    if ed_n_op.Text <> '' then
    begin
      fungsi.SQLExec(dm.Q_temp, 'select md5("' + ed_pass.Text + '")as passs', true);
      passs := dm.Q_temp.fieldbyname('passs').AsString;

      if compareText(userPassword, passs) <> 0 then
      begin
        messagedlg('Password salah..', mtError, [mbOk], 0);
        ed_pass.Clear;
        ed_pass.SetFocus;
      end
      else
      begin
        if dm.HakAkses('tkAdmin', ed_kd_op.Text, dm.kd_perusahaan) then
        begin
          fungsi.SQLExec(dm.Q_exe, 'update tb_login_jaga set `mode`="offline"' +
            ' where `user` = "' + ed_kd_op.Text + '" and kd_perusahaan = "' + dm.kd_perusahaan
            + '"', false);

          fungsi.SQLExec(dm.q_exe, 'replace into tb_login_jaga(kd_perusahaan, '
            + 'user,nama_user,tanggal,mode,komp)values("' + dm.kd_perusahaan +
            '","' + ed_kd_op.Text + '","' + ed_n_op.Text +
            '",now(),''online'',"' + ip_kasir + '")', false);
        end;

        dm.kd_operator := ed_kd_op.Text;
        dm.n_operator := ed_n_op.Text;

        simpanKodePerusahaan;
        dm.Login := True;
        close;
      end;
    end;
    dm.db_Conn.Commit;
  except
    dm.db_Conn.Rollback;
  end;
end;

procedure TF_Login.ed_kd_opChange(Sender: TObject);
begin
  ed_n_op.Clear;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  f_login := nil;
end;

procedure TF_Login.ed_passKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    b_loginClick(Sender);
  end;
end;

procedure TF_Login.cek_update;
var
  versiDB, versiAPP, URLDownload: string;
  fileName, UrlDownloadLocal: string;
begin
  versiAPP := fungsi.GetVersiApp;

  fungsi.SQLExec(dm.Q_Show,
    'select versi_terbaru, URLdownload from  app_versi where kode="pos_server.exe"',
    true);
  versiDB := dm.Q_Show.FieldByName('versi_terbaru').AsString;
  URLDownload := dm.Q_Show.FieldByName('URLdownload').AsString;
  fileName := Copy(URLDownload, LastDelimiter('/', URLDownload) + 1, Length(URLDownload));
  UrlDownloadLocal := 'http://' + dm.db_conn.Host + '/GainProfit/' + fileName;

  if versiAPP < versiDB then
  begin
    ShowMessage('APLIKASI POS Server TIDAK DAPAT DIJALANKAN' + #13#10 +
      'aplikasi terbaru dengan versi : ' + versiDB + #13#10 + 'SUDAH DIRILIS...');

    Application.Terminate;
  end;
end;

procedure TF_Login.FormCreate(Sender: TObject);
begin
  cek_update;
end;

procedure TF_Login.sbClick(Sender: TObject);
begin
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi := 'select kd_perusahaan, n_perusahaan from tb_company';
    tblcap[0] := 'Kode';
    tblCap[1] := 'Nama Perusahaan';
    if ShowModal = mrOk then
    begin
      dm.kd_perusahaan := TblVal[0];
      sb.Panels[0].Text := dm.kd_perusahaan;
      sb.Panels[1].Text := TblVal[1];
      ed_kd_op.Clear;
      ed_pass.Enabled := False;
      ed_kd_op.SetFocus;
    end;
  finally
    close;
  end;
end;

procedure TF_Login.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
    sbClick(self);
end;

procedure TF_Login.simpanKodePerusahaan;
var
  appINI: TIniFile;
begin
  appINI := TIniFile.Create(dm.AppPath + 'gain.ini');
  appINI.WriteString('toko', 'kd_perusahaan', dm.kd_perusahaan);
  appINI.Free;
end;

end.

