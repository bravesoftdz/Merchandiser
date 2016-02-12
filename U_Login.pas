unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  ComCtrls, acProgressBar, sButton, sGauge, U_fungsi, sGroupBox, sEdit,
  Buttons, sBitBtn, sRichEdit, sRadioButton, sStatusBar,inifiles,Winsock,TlHelp32;

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
    gb_pilihan: TsGroupBox;
    rb_jaga: TsRadioButton;
    rb_so: TsRadioButton;
    sButton1: TsButton;
    sButton2: TsButton;
    sb: TsStatusBar;
    procedure FormShow(Sender: TObject);
    procedure ed_kd_opKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_n_opEnter(Sender: TObject);
    procedure b_loginClick(Sender: TObject);
    procedure ed_kd_opChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_passKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    class function Execute : boolean;
    { Public declarations }
  end;

var
  F_Login: TF_Login;
  fungsi:Tfungsi;
  status:string;

implementation

uses u_dm, u_utama, u_SO;

{$R *.dfm}

//===========================================
//procedure untuk mendapatkan Local Host dan Local IP
//=============================================
function GetIPFromHost
(var HostName, IPaddr, WSAErr: string): Boolean; 
type 
  Name = array[0..100] of Char; 
  PName = ^Name; 
var 
  HEnt: pHostEnt; 
  HName: PName; 
  WSAData: TWSAData; 
  i: Integer; 
begin 
  Result := False;     
  if WSAStartup($0101, WSAData) <> 0 then begin 
    WSAErr := 'Winsock is not responding."'; 
    Exit; 
  end; 
  IPaddr := ''; 
  New(HName); 
  if GetHostName(HName^, SizeOf(Name)) = 0 then
  begin 
    HostName := StrPas(HName^); 
    HEnt := GetHostByName(HName^); 
    for i := 0 to HEnt^.h_length - 1 do 
     IPaddr :=
      Concat(IPaddr,
      IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.'); 
    SetLength(IPaddr, Length(IPaddr) - 1); 
    Result := True; 
  end
  else begin 
   case WSAGetLastError of
    WSANOTINITIALISED:WSAErr:='WSANotInitialised'; 
    WSAENETDOWN      :WSAErr:='WSAENetDown'; 
    WSAEINPROGRESS   :WSAErr:='WSAEInProgress';
   end;
  end;
  Dispose(HName);
  WSACleanup;
end;
//=================================================

class function TF_Login.Execute: boolean;
begin
  with TF_Login.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TF_Login.FormShow(Sender: TObject);
begin
pilihan:=0;
sb.Panels[0].Text:=kd_comp;
fungsi.SQLExec(dm.Q_temp,'select * from tb_company where kd_perusahaan = "'+sb.Panels[0].text+'"',true);
sb.Panels[1].Text:=dm.Q_temp.fieldbyname('n_perusahaan').AsString;

sb.Panels[2].Text:=dm.db_conn.DatabaseName+'@'+dm.db_conn.Host;
end;

procedure TF_Login.ed_kd_opKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  FUNGSI.SQLExec(DM.Q_Show,'select * from tb_user where kd_user="'+ed_kd_op.Text+'" and toko=''Y'' and kd_perusahaan="'+sb.Panels[0].Text+'"',true);
  if dm.Q_show.Eof then
    Begin
    messagedlg('Kode ini tidak terdaftar...',mtError,[mbOk],0);
    ed_kd_op.SetFocus;
    End else
    begin
      ed_pass.Enabled:= true;
      Ed_Pass.SetFocus;
      Ed_N_op.Text:= dm.Q_show.fieldbyname('n_user').AsString;
    end;
end;

if key=vk_escape then close;

end;

procedure TF_Login.ed_n_opEnter(Sender: TObject);
begin
ed_kd_op.SetFocus;
end;

procedure TF_Login.b_loginClick(Sender: TObject);
var passs:string;
  Host, IP, Err,ip_kasir: string;
begin
  if GetIPFromHost(Host, IP, Err) then ip_kasir := IP //masupin local IP ke edit1
   else MessageDlg(Err, mtError, [mbOk], 0);

dm.db_conn.StartTransaction;
try
if ed_n_op.Text<>'' then
begin
fungsi.SQLExec(dm.Q_temp,'select md5("'+ed_pass.Text+'")as passs',true);
passs:=dm.Q_temp.fieldbyname('passs').AsString;

  if compareText(dm.Q_show.FieldByName('password').AsString,passs)<>0 then
  begin
    messagedlg('Password salah..',mtError,[mbOk],0);
    ed_pass.Clear;
    ed_pass.SetFocus;
  end else
  begin
    if rb_jaga.Checked=true then
    begin
     fungsi.SQLExec(dm.Q_exe,'update tb_login_jaga set `mode`="offline" where `user`= "'+
     ed_kd_op.Text+'" and status="jaga" and kd_perusahaan="'+sb.Panels[0].Text+'"',false);

     fungsi.SQLExec(dm.q_exe,'replace into tb_login_jaga(kd_perusahaan,user,nama_user,tanggal,status,mode,komp)values("'+
     sb.Panels[0].Text+'","'+ed_kd_op.Text+'","'+ed_n_op.Text+'",date(now()),''jaga'',''online'',"'+ip_kasir+'")',false);
{      fungsi.SQLExec(dm.Q_temp,'select * from tb_login_jaga where kd_perusahaan="'+
      sb.Panels[0].Text+'" and `user`="'+ed_kd_op.Text+'" and tanggal= date(now()) and status=''jaga''',true);
      if dm.Q_temp.Eof then
         begin
          fungsi.SQLExec(dm.q_exe,'insert into tb_login_jaga(kd_perusahaan,user,nama_user,tanggal,status,mode,komp)values("'+sb.Panels[0].Text+'","'+ed_kd_op.Text
          +'", "'+ed_n_op.Text+'",date(now()),''jaga'',''online'',"'+ip_kasir+'")',false);
         end else
         begin
          fungsi.SQLExec(dm.Q_exe,'update tb_login_jaga set mode=''online'' where tanggal=date(now()) and user= "'+
          ed_kd_op.Text+'" and status=''jaga'' and kd_perusahaan="'+sb.Panels[0].Text+'"',false);
         end;
}     kd_operator:=ed_kd_op.Text;
      n_operator:= ed_n_op.Text;
      pilihan:=1;
    end else
    begin
     fungsi.SQLExec(dm.q_exe,'replace into tb_login_jaga(kd_perusahaan,user,nama_user,tanggal,status,mode,komp)values("'+
     sb.Panels[0].Text+'","'+ed_kd_op.Text+'", "'+ed_n_op.Text+'",date(now()),''SO'',''online'',"'+ip_kasir+'")',false);
{      fungsi.SQLExec(dm.Q_temp,'select * from tb_login_jaga where kd_perusahaan="'+
      sb.Panels[0].Text+'" and `user`="'+ed_kd_op.Text+'" and tanggal= date(now()) and status=''SO''',true);
      if dm.Q_temp.Eof then
         begin
          fungsi.SQLExec(dm.q_exe,'insert into tb_login_jaga(kd_perusahaan,user,nama_user,tanggal,status,mode,komp)values("'+sb.Panels[0].Text+'","'+ed_kd_op.Text
          +'", "'+ed_n_op.Text+'",date(now()),''SO'',''online'',"'+ip_kasir+'")',false);
         end else
         begin
          fungsi.SQLExec(dm.Q_exe,'update tb_login_jaga set mode=''online'' where tanggal=date(now()) and user= "'+
          ed_kd_op.Text+'" and status=''SO'' and kd_perusahaan="'+sb.Panels[0].Text+'"',false);
         end;
}     kd_operator:=ed_kd_op.Text;
      n_operator:= ed_n_op.Text;
      pilihan:=2;
    end;
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
action:= cafree;
f_login:=nil;
end;


procedure TF_Login.ed_passKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
b_loginClick(Sender);
end;
end;

end.

