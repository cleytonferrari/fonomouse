program Layout01;

uses
  Forms,
  ULayout01 in 'ULayout01.pas' {Form1},
  UAjuda in 'UAjuda.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
