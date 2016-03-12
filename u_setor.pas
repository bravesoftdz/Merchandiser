unit u_setor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sEdit, U_fungsi, DB, Grids, DBGrids, Mask,
  sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, Buttons, sBitBtn,
  frxClass, frxDBSet, frxDesgn, frxExportXML, frxExportXLS, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, sGroupBox, cxCurrencyEdit, AdvDateTimePicker, sTooledit,
  ExtCtrls, sPanel, Menus;

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
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    ed_Kd_kasir: TsEdit;
    ed_set_OC: TsCurrencyEdit;
    ed_set_Real: TsCurrencyEdit;
    ed_selisih: TsCurrencyEdit;
    b_simpan: TsBitBtn;
    b_cetak: TsBitBtn;
    p1: TsPanel;
    l_5: TsLabel;
    b_refresh: TsBitBtn;
    l_10: TsLabel;
    l_11: TsLabel;
    l_12: TsLabel;
    l_13: TsLabel;
    ed_return: TsCurrencyEdit;
    ed_Total: TsCurrencyEdit;
    ed_Kredit: TsCurrencyEdit;
    ed_disc: TsCurrencyEdit;
    de_trans: TsDateEdit;
    pm1: TPopupMenu;
    mnigetonline1: TMenuItem;
    mniN1: TMenuItem;
    mniRefresh1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ed_Kd_kasirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_set_RealChange(Sender: TObject);
    procedure ed_set_RealKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_simpanClick(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
    procedure b_refreshClick(Sender: TObject);
    procedure laporanClickObject(view: TfrxView; Button: TMouseButton;
      Shift: TShiftState; var Modified: Boolean);
    procedure mniRefresh1Click(Sender: TObject);
    procedure mnigetonline1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Setor: TF_Setor;
  fungsi:TFungsi;
implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_Setor.FormShow(Sender: TObject);
begin

fungsi.SQLExec(dm.Q_temp,'select tanggal from tb_login_kasir where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" '+
'and kd_jaga="'+f_utama.sb.Panels[3].Text+'"  and `status` = ''online'' order by `status` ASC limit 1',true);
  if dm.Q_temp.Eof then
    de_trans.Date := Date()
  else
    de_trans.Date := dm.Q_temp.FieldByName('tanggal').AsDateTime;

  b_refreshClick(Self);
{
fungsi.SQLExec(dm.Q_temp,'select Sum(void) as sum_void, '+
'Sum(discount) as sum_discount,Sum(return_jual) as sum_return_jual, Sum(kredit) as sum_kredit,Sum(price_oh) as sum_price_oh, '+
'Sum(jumlah_setor_oh) as sum_jumlah_setor_oh,Sum(jumlah_setor_real) as sum_jumlah_setor_real, '+
'Sum(selisih) as sum_selisih from tb_login_kasir inner join tb_user on '+
'tb_user.kd_user=tb_login_kasir.user where status=''online'' and tb_login_kasir.kd_jaga="'+f_utama.sb.Panels[3].Text+'" and tb_login_kasir.kd_perusahaan="'+
f_utama.sb.Panels[5].Text+'"',true);
}end;

procedure TF_Setor.ed_Kd_kasirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );

    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_exe,'call sp_setor_kasir("'+f_utama.sb.Panels[5].Text+'","'+
      ed_Kd_kasir.Text+'","'+f_utama.Sb.Panels[3].Text+'")',False);
      dm.db_Conn.Commit;
    except on e:exception do
     begin
      dm.db_conn.Rollback;
      showmessage('proses update data gagal... '#10#13'' +e.Message);
     end;
    end;

    fungsi.SQLExec(dm.Q_temp,'select * from tb_login_kasir inner join tb_user on '+
    'tb_user.kd_user=tb_login_kasir.user where tb_login_kasir.kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" '+
    'and tb_login_kasir.user="'+ed_kd_kasir.Text+'" and tb_login_kasir.kd_jaga="'+f_utama.sb.Panels[3].Text+'" and status=''online''',true);
    if dm.Q_temp.Eof then
      begin
        showmessage('Id Kasir ini tidak ada dalam daftar kasir yang belum setor');
        ed_set_real.SetFocus;
        ed_kd_kasir.SetFocus;
      end else
      begin
        ed_set_oc.Value:= dm.Q_temp.fieldbyname('jumlah_setor_oh').AsInteger;

        Ed_Disc.Value:= dm.Q_temp.fieldbyname('discount').AsInteger;
        Ed_Kredit.Value:= dm.Q_temp.fieldbyname('kredit').AsInteger;
        Ed_Total.Value:= dm.Q_temp.fieldbyname('price_oh').AsInteger;
        ed_return.Value:= dm.Q_temp.FieldByName('return_jual').AsInteger;

        ed_set_real.ReadOnly:= false;
        ed_set_real.SetFocus;
        b_simpan.Enabled:=true;
      end;
  end;
end;

procedure TF_Setor.ed_set_RealChange(Sender: TObject);
begin
ed_selisih.Value:= ed_set_real.Value-ed_set_oc.Value;
end;

procedure TF_Setor.ed_set_RealKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
b_simpan.SetFocus;
end;
end;

procedure TF_Setor.b_simpanClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_Exe,'update tb_login_kasir set jumlah_setor_real="'+ed_set_real.Text
+'", tgl_logout=now(),selisih="'+ed_selisih.Text+'",status=''offline'' where kd_perusahaan="'+
f_utama.sb.Panels[5].Text+'" and user="'+ed_kd_kasir.Text
+'" and kd_jaga="'+f_utama.sb.Panels[3].Text+'" and status="online"',false);

dm.db_conn.Commit;
showmessage('penyimpanan data sukses');
b_refreshClick(Self);
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
end;

procedure TF_Setor.b_cetakClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_login_kasir inner join tb_user on '+
'tb_user.kd_user=tb_login_kasir.`user` '+
'where status=''offline'' and tanggal >= "'+formatdatetime('yyyy-MM-dd hh:mm:ss',de_trans.Date)+'" and tb_login_kasir.kd_jaga="'+
f_utama.sb.Panels[3].Text+'" and tb_login_kasir.kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
laporan.LoadFromFile(dm.a_path + 'laporan\p_setor_kasir.fr3');
laporan.ShowReport;
end;

procedure TF_Setor.b_refreshClick(Sender: TObject);
begin
ed_disc.Clear;
ed_Kredit.Clear;
ed_Total.Clear;
ed_return.Clear;
ed_kd_kasir.Clear;
ed_set_real.Clear;
ed_set_oc.Clear;
ed_selisih.Clear;
ed_set_real.ReadOnly:= true;
B_simpan.Enabled:= false;

fungsi.SQLExec(dm.Q_show,'SELECT * FROM tb_login_kasir INNER JOIN tb_user ' +
'ON tb_user.kd_user = tb_login_kasir.`user` WHERE '+
'tanggal >= "'+formatdatetime('yyyy-MM-dd hh:mm:ss',de_trans.Date)+'" AND ' +
'tb_login_kasir.kd_jaga="'+f_utama.sb.Panels[3].Text+'" AND ' +
'tb_login_kasir.kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" '+
'ORDER BY tanggal DESC',true);

if dm.Q_show.Eof then
begin
  de_trans.SetFocus;
  ed_Kd_kasir.Enabled:= False;
  ed_set_Real.Enabled:= False;
  b_cetak.Enabled:= False;
end else
begin
  b_cetak.Enabled:= True;
  ed_Kd_kasir.Enabled:= True;
  ed_set_Real.Enabled:= True;
  ed_kd_kasir.SetFocus;
end;
end;

procedure TF_Setor.laporanClickObject(view: TfrxView;
  Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
begin
  if view.Name = 'mm_kasir_user' then
  begin
    fungsi.SQLExec(dm.Q_temp,'select * from tb_login_kasir inner join tb_user '+
    'on tb_user.kd_user=tb_login_kasir.user '+
    'where tb_login_kasir.kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" '+
    'and tb_login_kasir.user="'+View.TagStr+'" and tb_login_kasir.kd_jaga="'+
    f_utama.sb.Panels[3].Text+'" and tanggal >= "'+formatdatetime('yyyy-MM-dd hh:mm:ss',de_trans.Date)+'"',true);

    r_detail_setor.LoadFromFile(dm.a_path + 'laporan\p_setor_kasir_detail.fr3');
    r_detail_setor.ShowReport;
  end;
end;

procedure TF_Setor.mniRefresh1Click(Sender: TObject);
begin
b_refreshClick(Self);
end;
                    
procedure TF_Setor.mnigetonline1Click(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp,'select count(tanggal) as total from tb_login_kasir'
  +' where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" '
  +' and `user`="'+dm.Q_show.fieldbyname('user').AsString+'" '
  +' and kd_jaga="'+f_utama.sb.Panels[3].Text+'" AND `status` = "online"',true);

  if dm.Q_temp.FieldByName('total').AsInteger <> 0 then
  begin
    ShowMessage('data terahir untuk user masih aktif....');
  end else
  begin
    fungsi.SQLExec(dm.Q_temp,'select `user`,tanggal from tb_login_kasir'
    +' where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'" and `user`="'
    + dm.Q_show.fieldbyname('user').AsString+'" and kd_jaga="'
    + f_utama.sb.Panels[3].Text+'" ORDER BY `status`,tanggal DESC limit 1',true);
    ShowMessage(dm.Q_temp.SQL.Text);
  
    dm.db_conn.StartTransaction;
    try
      fungsi.SQLExec(dm.Q_Exe,'update tb_login_kasir set status="online" where kd_perusahaan="'+
      f_utama.sb.Panels[5].Text+'" and user="'+dm.Q_temp.fieldbyname('user').AsString
      +'" and kd_jaga="'+f_utama.sb.Panels[3].Text+'" and tanggal="'+
      formatdatetime('yyyy-MM-dd hh:mm:ss',dm.Q_temp.fieldbyname('tanggal').AsDateTime)+'"',false);

      dm.db_conn.Commit;
      showmessage('Penggantian status Berhasil...');
      b_refreshClick(Self);
    except on e:exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' +e.Message);
    end;
    end;
  end;
end;

end.

