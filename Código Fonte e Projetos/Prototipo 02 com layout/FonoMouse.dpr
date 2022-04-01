program FonoMouse;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  UMenuLateral in 'UMenuLateral.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
