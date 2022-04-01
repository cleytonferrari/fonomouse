unit UMenuLateral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SkinImage, JvComponent, JvTransparentForm, JvMagnet;

type
  TForm2 = class(TForm)
    SkinImage1: TSkinImage;
    Timer1: TTimer;
    JvTransparentForm1: TJvTransparentForm;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  { if form2.Width < 480 then begin
     form2.Width := form2.Width + 20;
     form2.Left := form2.Left - 20; end
   else
     timer1.Interval :=0;}
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 top:= 490;//form1.top-300;//107;
 left:= 513;//form1.left;//864;
end;

end.
