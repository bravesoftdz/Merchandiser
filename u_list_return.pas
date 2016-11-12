unit u_list_return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, 
  cxDataStorage, cxEdit, DB, cxDBData, sSkinProvider, StdCtrls, Buttons,
  sBitBtn, ExtCtrls, sPanel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,UFungsi, cxStyles,
  cxCustomData, cxFilter, cxData, cxCurrencyEdit;

type
  Tf_list_return = class(TForm)
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    sPanel1: TsPanel;
    sSkinProvider1: TsSkinProvider;
    t_datakd_return: TcxGridDBColumn;
    t_datatgl_return: TcxGridDBColumn;
    t_datanilai_faktur: TcxGridDBColumn;
    t_datan_supp: TcxGridDBColumn;
    sBitBtn6: TsBitBtn;
    sBitBtn2: TsBitBtn;
    t_dataColumn1: TcxGridDBColumn;
    t_dataColumn2: TcxGridDBColumn;
    t_dataColumn3: TcxGridDBColumn;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure segarkan;
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_list_return: Tf_list_return;
  

implementation

uses u_dm, u_return, u_utama;

{$R *.dfm}

procedure Tf_list_return.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(dm.metu_kabeh) then
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

procedure Tf_list_return.segarkan;
begin
fungsi.SQLExec(dm.q_list_return,'select * from vw_list_return  where kd_perusahaan="'+
f_utama.sb.panels[5].Text+'"',true);
end;


procedure Tf_list_return.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
action:=cafree;
f_list_return:= nil;
end;

procedure Tf_list_return.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
if f_return <> nil then
f_return.Show else
begin
application.CreateForm(tf_return, f_return);
f_return.Show;
end;
f_return.tampil_data;
end;

procedure Tf_list_return.sBitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tf_list_return.sBitBtn6Click(Sender: TObject);
begin
segarkan;
end;

procedure Tf_list_return.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
end;

end.
