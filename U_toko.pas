unit U_toko;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, acProgressBar, Buttons, sBitBtn, DBCtrls, Mask,
  StdCtrls, sButton, sUpDown, sEdit, sLabel, sRadioButton, sGroupBox,
  ExtCtrls, sPanel, Grids, DBGrids, sPageControl,UFungsi, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, sComboBox,
  sMaskEdit, sCustomComboEdit, sTooledit;

type
  TF_toko = class(TForm)
    sButton2: TsButton;
    cb_periode: TsComboBox;
    btnMutasi: TsButton;
    btnGross: TsButton;
    lbl1: TsLabel;
    btnMutasiHarga: TsButton;
    procedure btnGrossClick(Sender: TObject);
    procedure btnMutasiClick(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_periodeChange(Sender: TObject);
    procedure cekPeriode;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_toko: TF_toko;
  periode,bulan,tahun : string;

implementation

uses u_dm, u_utama;

{$R *.dfm}

procedure TF_toko.btnGrossClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_gross_margin where MONTH(tanggal)="'+
bulan+'" and YEAR(tanggal)="'+tahun+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_gross.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.btnMutasiClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from tb_mutasi_bulan where MONTH(tgl)="'+
bulan+'" and YEAR(tgl)="'+tahun+'" and kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
if TsButton(Sender).Name = 'btnMutasi' then
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_mutasi_global_stok.fr3') else
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_mutasi_global_uang.fr3');

dm.laporan.ShowReport;
end;

procedure TF_toko.sButton2Click(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_stok_out where kd_perusahaan="'+f_utama.sb.Panels[5].Text+'"',true);
dm.laporan.LoadFromFile(dm.a_path + 'laporan\gp_stok_out_harian.fr3');
dm.laporan.ShowReport;
end;

procedure TF_toko.FormCreate(Sender: TObject);
var x: Integer;
begin
fungsi.SQLExec(dm.Q_temp,'SELECT LEFT(tb_mutasi_bulan.tgl,7) as periode, '+
'left(date(now()),7) as sekarang FROM tb_mutasi_bulan where kd_perusahaan = "'+
F_Utama.sb.Panels[5].Text+'" GROUP BY LEFT(tb_mutasi_bulan.tgl,7)', true);

for x:= 1 to dm.Q_temp.RecordCount do
  begin
    cb_periode.Items.Add(dm.Q_temp.fieldbyname('periode').AsString);
    dm.Q_temp.Next;
  end;

cb_periode.ItemIndex:= cb_periode.Items.Count-1;
cekPeriode;
end;

procedure TF_toko.cb_periodeChange(Sender: TObject);
begin
cekPeriode;
end;

procedure TF_toko.cekPeriode;
begin
  periode:= cb_periode.Text;
  bulan:= Copy(periode,6,2);
  tahun:= Copy(periode,1,4);
end;

end.
