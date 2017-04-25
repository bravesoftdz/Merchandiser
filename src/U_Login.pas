unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sLabel, 
  ComCtrls, sButton, UFungsi, sEdit, Buttons,
  sStatusBar, inifiles, StdCtrls;

type
  TF_Login = class(TForm)
    sb: TStatusBar;
    Lbl1: TLabel;
    EdKdPengguna: TEdit;
    Lbl2: TLabel;
    EdNamaPengguna: TEdit;
    Lbl3: TLabel;
    EdPassword: TEdit;
    LblKeterangan: TLabel;
    BtnLogin: TButton;
    procedure simpanKodePerusahaan;
    procedure FormShow(Sender: TObject);
    procedure EdKdPenggunaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdNamaPenggunaEnter(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure EdKdPenggunaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    userPassword, userRealName: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_Login.FormShow(Sender: TObject);
begin
  dm.Login := False;
end;

procedure TF_Login.EdKdPenggunaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sql: string;
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    sql := 'SELECT tb_user.n_user, tb_user.`password` FROM tb_user INNER JOIN '
      + 'tb_user_company ON tb_user.kd_user = tb_user_company.kd_user WHERE ' +
      'tb_user.kd_user="' + EdKdPengguna.Text + '" AND tb_user_company.toko="Y" ' +
      'AND tb_user_company.kd_perusahaan="' + dm.kd_perusahaan + '"';
    fungsi.SQLExec(DM.Q_Show, sql, true);
    if dm.Q_show.Eof then
    begin
      messagedlg('Kode ini tidak terdaftar...', mtError, [mbOk], 0);
      EdKdPengguna.SetFocus;
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
          + 'AND user_id="' + EdKdPengguna.Text + '"';
        fungsi.SQLExec(DM.Q_Show, sql, true);
        if dm.Q_show.Eof then
        begin
          messagedlg('Tidak Dapat Login '#10#13'USER belum Check IN....',
            mtError, [mbOk], 0);
          EdKdPengguna.SetFocus;
          Exit;
        end;
      end;

      EdPassword.Enabled := true;
      EdPassword.SetFocus;
      EdNamaPengguna.Text := userRealName;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TF_Login.EdNamaPenggunaEnter(Sender: TObject);
begin
  EdKdPengguna.SetFocus;
end;

procedure TF_Login.BtnLoginClick(Sender: TObject);
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
    if EdNamaPengguna.Text <> '' then
    begin
      fungsi.SQLExec(dm.Q_temp, 'select md5("' + EdPassword.Text + '")as passs', true);
      passs := dm.Q_temp.fieldbyname('passs').AsString;

      if compareText(userPassword, passs) <> 0 then
      begin
        messagedlg('Password salah..', mtError, [mbOk], 0);
        EdPassword.Clear;
        EdPassword.SetFocus;
      end
      else
      begin
        dm.kd_pengguna := EdKdPengguna.Text;
        dm.n_pengguna := EdNamaPengguna.Text;

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

procedure TF_Login.EdKdPenggunaChange(Sender: TObject);
begin
  EdNamaPengguna.Clear;
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  f_login := nil;
end;

procedure TF_Login.EdPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnLoginClick(Sender);
  end;
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
      EdKdPengguna.Clear;
      EdPassword.Enabled := False;
      EdKdPengguna.SetFocus;
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

