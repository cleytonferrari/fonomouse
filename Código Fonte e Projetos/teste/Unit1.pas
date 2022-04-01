unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SkinImage, StdCtrls, JvComponent, JvTransparentForm,
  Buttons;

type
  TForm1 = class(TForm)
    JvTransparentForm1: TJvTransparentForm;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    Timer2: TTimer;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if (form1.Height > 150) and (form1.Height < 190) then
  TIMER1.Interval:= 10 ;
    if (form1.Height > 550) and (form1.Height < 700) then
  timer2.Interval := 10;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   if form1.Height < 615 then begin
      form1.Height := Form1.Height + 25;
   end else
   begin
     timer1.Interval := 0;
   end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
   if form1.Height > 160 then begin
      form1.Height := Form1.Height - 25;
   end else
   begin
     timer2.Interval := 0;
   end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
