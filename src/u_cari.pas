unit u_cari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi, ExtCtrls, DBCtrls, sSkinProvider, cxCustomData, cxGraphics,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxStyles, MyAccess, StdCtrls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator,
  cxFilter, cxData, MemDS, DBAccess;

type
  NewControl = class(TControl);

  Tf_cari = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_cari: TEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    BtnPilih: TButton;
    ds_cari: TDataSource;
    Q_cari: TMyQuery;
    BtnKeluar: TButton;
    procedure Ed_cariChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure t_dataDblClick(Sender: TObject);
    procedure t_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnPilihClick(Sender: TObject);
  private
    { Private declarations }
  public
    _SQLi, nm_tabel, Kondisi: string;
    TblCap: array [0 .. 10] of string;
    TblVal: array [0 .. 10] of string;
    CariT: Integer;
  end;

var
  F_cari: Tf_cari;
  TblTemp: TStringList;

implementation

uses
  u_dm;

{$R *.dfm}

function cari_tabel(sql: string): string;
var
  nPos, npos2, npos3: Integer;
begin
  nPos := Pos('from', LowerCase(sql));
  delete(sql, 1, nPos + 4);

  npos2 := Pos(' ', sql);
  npos3 := length(sql);
  delete(sql, npos2, npos3);

  result := sql;
end;

function cari_kondisi(sql: string): string;
var
  nPos: Integer;
begin
  nPos := Pos('where', LowerCase(sql));
  if nPos <> 0 then
    delete(sql, 1, nPos + 5)
  else
    sql := '';

  result := sql;
end;

procedure Tf_cari.Ed_cariChange(Sender: TObject);
var
  saringan: string;
  x: Integer;
begin
  for x := 0 to Q_cari.FieldCount - 1 do
    saringan := saringan + '`' + Q_cari.Fields[x].FieldName + '`' + ' like "%' +
      Ed_cari.Text + '%" or ';

  delete(saringan, length(saringan) - 3, 4);

  fungsi.SQLExec(Q_cari, 'select ' + TblTemp.CommaText + ' from ' + nm_tabel +
    ' where ' + Kondisi + '(' + saringan + ') limit 0,100', true);
end;

procedure Tf_cari.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnPilihClick(Sender);
  end;

  if Key = vk_escape then
    close;

  if Key = vk_f2 then
    Ed_cari.SetFocus;

  if Key = vk_up then
  begin
    t_data.DataController.FocusedRowIndex :=
      t_data.DataController.FocusedRowIndex - 1;
    Key := VK_NONAME;
  end;

  if Key = vk_down then
  begin
    t_data.DataController.FocusedRowIndex :=
      t_data.DataController.FocusedRowIndex + 1;
  end;
end;

procedure Tf_cari.FormShow(Sender: TObject);
var
  x: Integer;
begin
  fungsi.SQLExec(Q_cari, _SQLi + ' limit 0,100', true);

  nm_tabel := cari_tabel(_SQLi);

  if cari_kondisi(_SQLi) <> '' then
    Kondisi := cari_kondisi(_SQLi) + ' AND '
  else
    Kondisi := '';

  TblTemp.Clear;

  for x := 0 to Q_cari.FieldCount - 1 do
  begin
    TblTemp.Add('`' + Q_cari.Fields[x].FieldName + '`');
    t_data.CreateColumn;
    t_data.Columns[x].DataBinding.FieldName := Q_cari.Fields[x].FieldName;
    t_data.Columns[x].Caption := TblCap[x];
  end;
  t_data.ApplyBestFit;
end;

procedure Tf_cari.t_dataDblClick(Sender: TObject);
begin
  BtnPilihClick(Sender);
end;

procedure Tf_cari.t_dataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    BtnPilihClick(Sender);
end;

procedure Tf_cari.BtnPilihClick(Sender: TObject);
var
  x: Integer;
begin
  for x := 0 to Q_cari.FieldCount - 1 do
  begin
    TblVal[x] := Q_cari.fieldbyname
      (t_data.Columns[x].DataBinding.FieldName).AsString;
  end;
  ModalResult := mrOk;
end;

initialization

TblTemp := TStringList.Create;

finalization

TblTemp.Free;

end.
