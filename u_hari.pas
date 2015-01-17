unit u_hari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel;

type
  Tf_hari = class(TForm)
    l_1: TsLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_hari: Tf_hari;

implementation

{$R *.dfm}

procedure Tf_hari.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= caFree;
f_hari:= nil;
end;

end.
