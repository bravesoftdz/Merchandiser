unit u_list_so_plan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, sSkinProvider,
  StdCtrls, Buttons, sBitBtn, ExtCtrls, sPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, sSpeedButton, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sLabel, mySQLDbTables;

type
  Tf_list_so_plan = class(TForm)
    grid: TcxGrid;
    grid_data: TcxGridDBTableView;
    tvKodeKoreksi: TcxGridDBColumn;
    tvDibuatPada: TcxGridDBColumn;
    tvQtyReal: TcxGridDBColumn;
    tvTotalHpp: TcxGridDBColumn;
    l_data: TcxGridLevel;
    sPanel1: TsPanel;
    sknprvdr1: TsSkinProvider;
    sb_1: TsSpeedButton;
    sb_2: TsSpeedButton;
    QList: TmySQLQuery;
    dsDsList: TDataSource;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure segarkan;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_list_so_plan: Tf_list_so_plan;

implementation

uses u_dm, u_utama, u_stok_opname;

{$R *.dfm}

procedure Tf_list_so_plan.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_list_so_plan.segarkan;
begin
fungsi.SQLExec(QList,'SELECT kd_koreksi, sum(harga_pokok) as harga_pokok, '+
                     'sum(qty_real) as qty_real, sum(harga_pokok * qty_real) AS total_hpp, '+
                     'create_at FROM tb_koreksi_temp WHERE kd_perusahaan = "'+ F_Utama.sb.Panels[5].Text +
                     '" GROUP BY kd_koreksi',true);
end;


procedure Tf_list_so_plan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
f_list_so_plan:= nil;
f_utama.MDIChildDestroyed(Self.Handle);
end;

procedure Tf_list_so_plan.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Application.CreateForm(Tf_stok_opname,f_stok_opname);
  f_stok_opname.ed_kodeSO.Text:= QList.FieldByName('kd_koreksi').AsString;
  f_stok_opname.Show;
end;

procedure Tf_list_so_plan.FormShow(Sender: TObject);
begin
segarkan;
end;

procedure Tf_list_so_plan.FormCreate(Sender: TObject);
begin
f_utama.MDIChildCreated(self.Handle);
segarkan;
end;

procedure Tf_list_so_plan.sb_1Click(Sender: TObject);
begin
close;
end;

procedure Tf_list_so_plan.sb_2Click(Sender: TObject);
begin
segarkan;
end;

end.
