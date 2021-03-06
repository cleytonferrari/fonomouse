unit UGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransparentForm;

type
  TfrmGrade = class(TForm)
    Transparente: TJvTransparentForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrade: TfrmGrade;

implementation

{$R *.dfm}

procedure TfrmGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frmGrade.Release;
   frmGrade := nil;
end;

procedure TfrmGrade.FormShow(Sender: TObject);
begin
  frmGrade.FormStyle:= fsStayOnTop;
end;

end.
