unit u_list_receipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, sSkinProvider,
  Buttons, sBitBtn, ExtCtrls, sPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, UFungsi, cxCurrencyEdit, cxStyles,
  cxCalendar, cxCustomData, cxFilter, cxData, StdCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator;

type
  Tf_list_receipt = class(TForm)
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    sPanel1: TPanel;
    sSkinProvider1: TsSkinProvider;
    t_datakd_receipt: TcxGridDBColumn;
    t_datatgl_receipt: TcxGridDBColumn;
    t_datanilai_faktur: TcxGridDBColumn;
    t_datan_supp: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    sBitBtn2: TsBitBtn;
    sBitBtn6: TsBitBtn;
    t_dataColumn2: TcxGridDBColumn;
    t_dataColumn3: TcxGridDBColumn;
    t_dataColumn4: TcxGridDBColumn;
    t_dataColumn5: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure segarkan;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_list_receipt: Tf_list_receipt;

implementation

uses
  u_dm, u_RO, u_utama;

{$R *.dfm}

procedure Tf_list_receipt.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd);
  if not (dm.metu_kabeh) then
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

procedure Tf_list_receipt.segarkan;
begin
  fungsi.SQLExec(dm.q_list_receipt,
    'select * from vw_list_receipt where kd_perusahaan="' + dm.kd_perusahaan + '"', true);
end;

procedure Tf_list_receipt.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  if f_ro <> nil then
    f_RO.Show
  else
  begin
    application.CreateForm(tf_RO, f_RO);
    f_RO.Show;
  end;
  f_RO.tampil_data;
end;

procedure Tf_list_receipt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  f_list_receipt := nil;
end;

procedure Tf_list_receipt.sBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_list_receipt.sBitBtn6Click(Sender: TObject);
begin
  segarkan;
end;

procedure Tf_list_receipt.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

end.

