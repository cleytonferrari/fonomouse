unit UAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmAjuda = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    TextoAjuda: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuda: TfrmAjuda;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TfrmAjuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frmPrincipal.OkajudaClick(Self);
   frmAjuda.Release;
   frmAjuda := nil;
end;

procedure TfrmAjuda.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAjuda.FormShow(Sender: TObject);
begin
frmAjuda.Left := 35;
frmAjuda.Top := 120;
   //Carrega o arquivo de Ajuda
   if FileExists(GetCurrentDir+'\FonoMouseAjuda.rtf') then
     TextoAjuda.Lines.LoadFromFile(GetCurrentDir+'\FonoMouseAjuda.rtf')
end;

end.
