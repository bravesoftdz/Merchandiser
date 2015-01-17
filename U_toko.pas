unit U_toko;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, acProgressBar, Buttons, sBitBtn, DBCtrls, Mask,
  StdCtrls, sButton, sUpDown, sEdit, sLabel, sRadioButton, sGroupBox,
  ExtCtrls, sPanel, Grids, DBGrids, sPageControl,u_fungsi, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, sMaskEdit,
  sCustomComboEdit, sTooledit;

type
  TF_toko = class(TForm)
    pc_toko: TsPageControl;
    ts_margin: TsTabSheet;
    sLabel1: TsLabel;
    sStickyLabel1: TsStickyLabel;
    sStickyLabel2: TsStickyLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    b_cetak: TsButton;
    ts_mutasi: TsTabSheet;
    sLabel10: TsLabel;
    sStickyLabel3: TsStickyLabel;
    sStickyLabel4: TsStickyLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    sButton1: TsButton;
    sTabSheet1: TsTabSheet;
    sLabel3: TsLabel;
    sButton2: TsButton;
    grid_data: TcxGridDBTableView;
    g_Grid1Level1: TcxGridLevel;
    g_stok: TcxGrid;
    clmn_stokGrid1DBTableView1Column1: TcxGridDBColumn;
    clmn_stokGrid1DBTableView1Column2: TcxGridDBColumn;
    clmn_stokGrid1DBTableView1Column3: TcxGridDBColumn;
    clmn_stokGrid1DBTableView1Column4: TcxGridDBColumn;
    btn_benarkan_mutasi: TsButton;
    dt_mutasi: TsDateEdit;
    procedure FormShow(Sender: TObject);
    procedure b_cetakClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure btn_benarkan_mutasiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_toko: TF_toko;
  fungsi: TFungsi;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_toko.FormShow(Sender: TObject);
begin
dt_mutasi.Date:= Date();
dm.Q_mutasi_toko.RecNo:=dm.Q_mutasi_toko.RecordCount;
dm.Q_gross.RecNo:= dm.Q_Gross.RecordCount;
grid_data.DataController.FocusedRowIndex:=1;
pc_toko.ActivePage:=ts_margin;

fungsi.SQLExec(dm.q_stock_out,'select * from vw_stok_out where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
end;

procedure TF_toko.b_cetakClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_gross_margin where periode="'+
f_utama.cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_gross.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.sButton1Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_mutasi_toko where periode="'+
f_utama.cb_periode.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_Path + 'laporan\gp_mutasi_tgl.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.sButton2Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_stok_out where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_Path + 'laporan\gp_stok_out_harian.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.btn_benarkan_mutasiClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_Exe,'call sp_mutasi_repair("'+f_utama.sb.Panels[5].Text+'","'+
formatdatetime('yyyy-MM-dd',dt_mutasi.Date)+'")',false);
dm.db_conn.Commit;

showmessage('Proses Repair Mutasi Berhasil....');

except
on E:exception do
begin
dm.db_conn.Rollback;
messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
end;
end;
end;

end.
