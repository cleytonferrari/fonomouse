unit ULayout01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxfShapedForm, dxfPictureButton, dxfCheckBox;

type
  TForm1 = class(TForm)
    Fundo: TdxfShapedForm;
    img3: TImage;
    img1: TImage;
    img2: TImage;
    img4: TImage;
    imgSAIR: TImage;
    procedure imgSAIRMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSAIRMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSAIRClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Aberto:Boolean=false;
  Mesmo:Boolean;

implementation

uses UAjuda;

{$R *.dfm}

procedure TForm1.imgSAIRMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgSAIR.Visible := False;
end;

procedure TForm1.imgSAIRMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imgSAIR.Visible :=True;
end;

procedure TForm1.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img1.Visible := False;
end;

procedure TForm1.img1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img1.Visible := True;
end;

procedure TForm1.img2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img2.Visible := False;
end;

procedure TForm1.img3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img3.Visible := False;
end;

procedure TForm1.img4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img4.Visible := False;
end;

procedure TForm1.img4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img4.Visible := True;
end;

procedure TForm1.img3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img3.Visible := True;
end;

procedure TForm1.img2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  img2.Visible := True;
end;

procedure TForm1.imgSAIRClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.img1Click(Sender: TObject);
begin

 if aberto = false then begin
 try
  form2 := TForm2.Create(Application);
  form2.Width := 10;
  form2.nBook.ActivePage := 'Pagina02';
  form2.Show;
  form2.Timer1.Interval := 15;
  img2.Enabled := false;
  img3.Enabled := False;
  fundo.AlwaysMove:= False;
 except
   form2:=nil;
   form2.Free;
 end;
 end else
 begin
  form2.Timer2.Interval := 15;
  img2.Enabled := true;
  img3.Enabled := True;
  fundo.AlwaysMove:= True;
 end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  top:=108;
  left:= 781;
end;

procedure TForm1.img2Click(Sender: TObject);
begin
 if aberto = false then begin
 try
  form2 := TForm2.Create(Application);
  form2.Width := 10;
  form2.nBook.ActivePage := 'Pagina01';
  form2.Show;
  form2.Timer1.Interval := 15;
  img1.Enabled := false;
  img3.Enabled := False;
  fundo.AlwaysMove:= False;
 except
   form2:=nil;
   form2.Free;
 end;
 end else
 begin
   form2.Timer2.Interval := 15;
   img1.Enabled := true;
   img3.Enabled := True;
   fundo.AlwaysMove:= True;
 end;

end;

procedure TForm1.img3Click(Sender: TObject);
begin
 if aberto = false then begin
 try
  form2 := TForm2.Create(Application);
  form2.Width := 10;
  form2.nBook.ActivePage := 'Pagina03';
  form2.Show;
  form2.Timer1.Interval := 15;
  img1.Enabled := false;
  img2.Enabled := False;
  fundo.AlwaysMove:= False;
 except
   form2:=nil;
   form2.Free;
 end;
 end else
 begin
   form2.Timer2.Interval := 15;
   img1.Enabled := true;
   img2.Enabled := True;
  fundo.AlwaysMove:= True;   
 end;

end;

end.
