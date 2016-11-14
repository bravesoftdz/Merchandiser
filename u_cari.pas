unit u_cari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFungsi, StdCtrls, sEdit, sButton, ExtCtrls, DBCtrls, sSkinProvider,
  cxCustomData, cxGraphics, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxStyles, cxFilter, cxData,
  mySQLDbTables;

type
  NewControl = class(TControl);

  Tf_cari = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_cari: TsEdit;
    grid: TcxGrid;
    t_data: TcxGridDBTableView;
    l_data: TcxGridLevel;
    BtnPilih: TsButton;
    ds_cari: TDataSource;
    Q_cari: TmySQLQuery;
    BtnKeluar: TsButton;
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
    TblCap: array[0..10] of string;
    TblVal: array[0..10] of string;
    CariT: Integer;
  end;

var
  F_cari: TF_cari;
  TblTemp: TStringList;

implementation

uses
  u_dm;

{$R *.dfm}

function cari_tabel(sql: string): string;
var
  nPos, npos2, npos3: integer;
begin
  nPos := Pos('from', LowerCase(sql));
  delete(sql, 1, npos + 4);

  npos2 := pos(' ', sql);
  npos3 := length(sql);
  delete(sql, npos2, npos3);

  result := sql;
end;

function cari_kondisi(sql: string): string;
var
  nPos: integer;
begin
  nPos := Pos('where', LowerCase(sql));
  if nPos <> 0 then
    delete(sql, 1, npos + 5)
  else
    sql := '';

  result := sql;
end;

procedure Tf_cari.Ed_cariChange(Sender: TObject);
var
  saringan: string;
  x: Integer;
begin
  for x := 0 to q_cari.FieldCount - 1 do
    saringan := saringan + '`' + q_cari.Fields[x].FieldName + '`' + ' like "%' +
      ed_cari.Text + '%" or ';

  delete(saringan, Length(saringan) - 3, 4);

  fungsi.SQLExec(q_cari, 'select ' + TblTemp.CommaText + ' from ' + nm_tabel +
    ' where ' + kondisi + '(' + saringan + ') limit 0,100', true);
end;

procedure Tf_cari.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnPilihClick(Sender);
  end;

  if key = vk_escape then
    close;

  if key = vk_f2 then
    ed_cari.SetFocus;

  if key = vk_up then
  begin
    t_data.DataController.FocusedRowIndex := t_data.DataController.FocusedRowIndex - 1;
    key := VK_NONAME;
  end;

  if key = vk_down then
  begin
    t_data.DataController.FocusedRowIndex := t_data.DataController.FocusedRowIndex + 1;
  end;
end;

procedure Tf_cari.FormShow(Sender: TObject);
var
  x: Integer;
  clm: TcxGridDBColumn;
begin
  fungsi.SQLExec(Q_cari, _SQLi + ' limit 0,100', True);

  nm_tabel := cari_tabel(_SQLi);

  if cari_kondisi(_SQLi) <> '' then
    kondisi := cari_kondisi(_SQLi) + ' AND '
  else
    kondisi := '';

  TblTemp.Clear;

  for x := 0 to q_cari.FieldCount - 1 do
  begin
    TblTemp.Add('`' + q_cari.Fields[x].FieldName + '`');
    t_data.CreateColumn;
    t_data.Columns[x].DataBinding.FieldName := q_cari.Fields[x].FieldName;
    t_data.Columns[x].Caption := tblCap[x];
  end;
  t_data.ApplyBestFit;
end;

procedure Tf_cari.t_dataDblClick(Sender: TObject);
begin
  BtnPilihClick(Sender);
end;

procedure Tf_cari.t_dataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    BtnPilihClick(Sender);
end;

procedure Tf_cari.BtnPilihClick(Sender: TObject);
var
  x: Integer;
begin
  for x := 0 to q_cari.FieldCount - 1 do
  begin
    TblVal[x] := q_cari.fieldbyname(t_data.Columns[x].DataBinding.FieldName).AsString;
  end;
  ModalResult := mrOk;
end;

initialization
  TblTemp := TStringList.Create;

finalization
  TblTemp.Free;

end.

