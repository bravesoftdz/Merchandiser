unit u_list_purchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ExtCtrls, sPanel, sSkinProvider,
  cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, UFungsi, cxStyles, 
  sSpeedButton, sTooledit, sLabel, cxCustomData, cxFilter, cxData,
  StdCtrls, Mask, sMaskEdit, sCustomComboEdit;

type
  Tf_List_purchase = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    grid: TcxGrid;
    l_data: TcxGridLevel;
    t_data: TcxGridDBTableView;
    t_datakd_purchase: TcxGridDBColumn;
    t_datatgl_purchase: TcxGridDBColumn;
    t_datanilai_faktur: TcxGridDBColumn;
    t_datan_supp: TcxGridDBColumn;
    t_dataColumn1: TcxGridDBColumn;
    sb_2: TsSpeedButton;
    sb_1: TsSpeedButton;
    p1: TsPanel;
    l_1: TsLabel;
    l_2: TsLabel;
    de_mulai: TsDateEdit;
    de_sampai: TsDateEdit;
    procedure WMMDIACTIVATE(var msg: TWMMDIACTIVATE); message WM_MDIACTIVATE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure t_dataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
      TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure segarkan;
    procedure FormCreate(Sender: TObject);
    procedure sb_1Click(Sender: TObject);
    procedure sb_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_List_purchase: Tf_List_purchase;

implementation

uses
  u_dm, u_purchase, u_utama;

{$R *.dfm}

procedure Tf_List_purchase.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
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

procedure Tf_List_purchase.segarkan;
begin
  fungsi.SQLExec(dm.q_list_purchase,
    'select * from vw_list_purchase  where kd_perusahaan="' + dm.kd_perusahaan +
    '" and tgl_purchase >= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_mulai.Date))
    + ' and tgl_purchase <= ' + quotedstr(FormatDateTime('yyyy-MM-dd', de_sampai.Date))
    + '', true);
end;

procedure Tf_List_purchase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_utama.MDIChildDestroyed(Self.Handle);
  action := cafree;
  f_list_purchase := nil;
end;

procedure Tf_List_purchase.t_dataCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
  TShiftState; var AHandled: Boolean);
begin
  if f_purchase <> nil then
    f_purchase.Show
  else
  begin
    application.CreateForm(tf_purchase, f_purchase);
    f_purchase.Show;
  end;
  f_purchase.tampil_data;
end;

procedure Tf_List_purchase.FormCreate(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  de_mulai.Date := EncodeDate(Year, Month, 1);
  de_sampai.Date := Date();

  f_utama.MDIChildCreated(self.Handle);
end;

procedure Tf_List_purchase.sb_1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_List_purchase.sb_2Click(Sender: TObject);
begin
  segarkan;
end;

end.

