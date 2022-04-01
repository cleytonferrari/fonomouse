unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxfShapedForm;

type
  TForm1 = class(TForm)
    dxfShapedForm1: TdxfShapedForm;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  form1.Top := 0;
  form1.Left := 0;
end;

procedure TForm1.FormShow(Sender: TObject);
var
H : HWnd;
begin
H := FindWindow(Nil,'TesteGrade'); {troque project1 pelo nome do seu projeto}
if H <> 0 then ShowWindow(H,SW_HIDE);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
pt:tpoint;
begin
  //A1
  if key = 'q' then  begin
    pt.x := 128; pt.y := 128;
    SetCursorPos(pt.x,pt.y);
  end;
  //A2
  if key = 'a' then  begin
    pt.x := 128; pt.y := 385;
    SetCursorPos(pt.x,pt.y);
  end;
  //A3
  if key = 'z' then  begin
    pt.x := 128; pt.y := 642;
    SetCursorPos(pt.x,pt.y);
  end;


  //B1
  if key = 'w' then  begin
    pt.x := 385; pt.y := 128;
    SetCursorPos(pt.x,pt.y);
  end;
  //B2
  if key = 's' then  begin
    pt.x := 385; pt.y := 385;
    SetCursorPos(pt.x,pt.y);
  end;
  //B3
  if key = 'x' then  begin
    pt.x := 385; pt.y := 642;
    SetCursorPos(pt.x,pt.y);
  end;


  //C1
  if key = 'e' then  begin
    pt.x := 642; pt.y := 128;
    SetCursorPos(pt.x,pt.y);
  end;
  //C2
  if key = 'd' then  begin
    pt.x := 642; pt.y := 385;
    SetCursorPos(pt.x,pt.y);
  end;
  //C3
  if key = 'c' then  begin
    pt.x := 642; pt.y := 642;
    SetCursorPos(pt.x,pt.y);
  end;


  //D1
  if key = 'r' then  begin
    pt.x := 899; pt.y := 128;
    SetCursorPos(pt.x,pt.y);
  end;
  //D2
  if key = 'f' then  begin
    pt.x := 899; pt.y := 385;
    SetCursorPos(pt.x,pt.y);
  end;
  //D3
  if key = 'v' then  begin
    pt.x := 899; pt.y := 642;
    SetCursorPos(pt.x,pt.y);
  end;
end;

end.
