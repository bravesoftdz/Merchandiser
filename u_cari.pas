unit u_cari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_fungsi, StdCtrls, sEdit, sButton, ExtCtrls,
  DBCtrls, sSkinProvider, cxCustomData, cxGraphics,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxStyles,
  cxFilter, cxData;

type
  NewControl = class(TControl);
  Tf_cari = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_cari: TsEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    clm1: TcxGridDBColumn;
    clm2: TcxGridDBColumn;
    clm3: TcxGridDBColumn;
    clm4: TcxGridDBColumn;
    l_data: TcxGridLevel;
    b_pilih: TsButton;
    procedure Ed_cariChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure t_dataDblClick(Sender: TObject);
    procedure b_pilihClick(Sender: TObject);
    procedure Ed_cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure t_dataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_cari:TF_cari;
  sumber:TForm;
  tipe_cari: integer;
  asal,kondisi: string;
  fungsi:tfungsi;
implementation

uses u_dm, u_lap, u_SO, u_purchase;

{$R *.dfm}

function cari_tabel(sql:string):string;
var  nPos,npos2,npos3   : integer;
begin
  nPos:= Pos( 'from', sql );
  delete(sql,1,npos+4);

  npos2:= pos(' ',sql);
  npos3:= length(sql);
  delete(sql,npos2,npos3);

  result:= sql;
end;

function cari_kondisi(sql:string):string;
var  nPos   : integer;
begin
  nPos:= Pos('where', sql );
  if nPos<> 0 then
  delete(sql,1,npos+5) else
  sql:='';
  
  result:= sql;
end;


procedure Tf_cari.Ed_cariChange(Sender: TObject);
var nm_tabel: string;
begin
nm_tabel:= cari_tabel(dm.q_cari.SQL.Text);

case dm.q_cari.FieldCount of
  2:
  begin
    fungsi.SQLExec(dm.q_cari,'select '+clm1.DataBinding.FieldName+','+clm2.DataBinding.FieldName
    +' from '+nm_tabel+' where '+kondisi+'('+clm1.DataBinding.FieldName+' like "%'+
    ed_cari.Text+'%" or '+clm2.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%") limit 0,100',true);
  end;
  3:
  begin
    fungsi.SQLExec(dm.q_cari,'select '+clm1.DataBinding.FieldName+','+clm2.DataBinding.FieldName
    +','+clm3.DataBinding.FieldName+' from '+nm_tabel+' where '+kondisi+'('+clm1.DataBinding.FieldName+' like "%'+
    ed_cari.Text+'%" or '+clm2.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%"  or '+
    clm3.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%") limit 0,100',true);
  end;
  4:
  begin
    fungsi.SQLExec(dm.q_cari,'select '+clm1.DataBinding.FieldName+','+clm2.DataBinding.FieldName
    +','+clm3.DataBinding.FieldName+' from '+nm_tabel+' where '+kondisi+'('+clm1.DataBinding.FieldName+' like "%'+
    ed_cari.Text+'%" or '+clm2.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%"  or '+
    clm3.DataBinding.FieldName+'  like  "%'+ed_cari.Text+'%") limit 0,100',true);
  end;
end;
end;

procedure Tf_cari.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then close;

if key=vk_f2 then ed_cari.SetFocus;
end;

procedure Tf_cari.FormShow(Sender: TObject);
begin
  if cari_kondisi(dm.q_cari.SQL.Text)<>'' then
    kondisi:= cari_kondisi(dm.q_cari.SQL.Text)+ ' AND ' else
    kondisi:='';


case dm.q_cari.FieldCount of
  2:
  begin
    clm1.DataBinding.FieldName:= dm.q_cari.Fields[0].FieldName;
    clm2.DataBinding.FieldName:= dm.q_cari.Fields[1].FieldName;
    clm3.Visible:=false;
    clm4.Visible:=false;
  end;
  3:
  begin
    clm1.DataBinding.FieldName:= dm.q_cari.Fields[0].FieldName;
    clm2.DataBinding.FieldName:= dm.q_cari.Fields[1].FieldName;
    clm3.DataBinding.FieldName:= dm.q_cari.Fields[2].FieldName;
    clm4.Visible:=false;
  end;
  4:
  begin
    clm1.DataBinding.FieldName:= dm.q_cari.Fields[0].FieldName;
    clm2.DataBinding.FieldName:= dm.q_cari.Fields[1].FieldName;
    clm3.DataBinding.FieldName:= dm.q_cari.Fields[2].FieldName;
    clm4.DataBinding.FieldName:= dm.q_cari.Fields[3].FieldName;
  end;
end;
t_data.DataController.FocusedRowIndex:=1;
end;

procedure Tf_cari.t_dataDblClick(Sender: TObject);
begin
try
   case tipe_cari of
      1 : //kode Barang
      begin
      if asal='f_lap' then
      begin
      f_lap.ed_cari.Text:= dm.q_cari.fieldbyname('kd_barang').AsString;
      end else
      if asal='f_SO' then
      begin
      F_SO.ED_INPUT.Text:= dm.q_cari.fieldbyname('kd_barang').AsString;
      end else
      if asal='f_purchase' then
      begin
      f_purchase.ed_code.Text:= dm.q_cari.fieldbyname('kd_barang').AsString;
      end;
      end;
   end;
close;
except
end;

end;

procedure Tf_cari.b_pilihClick(Sender: TObject);
begin
t_dataDblClick(Sender);
end;

procedure Tf_cari.Ed_cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down) or (key=vk_up)then
grid.SetFocus;

if key= vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
t_dataDblClick(Sender);
end;
end;

procedure Tf_cari.t_dataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key= vk_return then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
t_dataDblClick(Sender);
end;
end;

procedure Tf_cari.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
f_cari:=nil;
end;

end.
