unit UAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxfShapedForm, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    dxfShapedForm1: TdxfShapedForm;
    Timer1: TTimer;
    Timer2: TTimer;
    NBook: TNotebook;
    RichEdit1: TRichEdit;
    Edit1: TEdit;
    Button1: TButton;
    RadioButton1: TRadioButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses ULayout01;

{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
begin
   if form2.Width < 680 then begin
   form2.Width := form2.Width + 20;
   form2.Left := form2.Left - 20; end
   else
     timer1.Interval :=0;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 top:= form1.top;//107;
 left:= form1.left+130;//864;
end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
   if form2.Width > 10 then begin
     form2.Width := form2.Width - 20;
     form2.Left := form2.Left + 20; end
   else begin
     timer2.Interval :=0;
     form2:=nil;
     close;
   end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Aberto:=True;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Aberto:=False;
end;

end.
