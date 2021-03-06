{
 ****************************************************
 * PROJETO:                                         *
 *                FonoMouse                         *
 *   Facilitador do Uso de Computador para          *
 *   portadores de necessidades especiais.          *
 *                                                  *
 *           Projeto  de  monografia  apresentada   *
 * ao Instituto de Ensino Superior  de  Rond?nia,   *
 * como parte  dos  requisitos   para a conclus?o   *
 * do curso de gradua??o em Sistema de Informa??o.  *
 *                                                  *
 * AUTOR: Cleyton Cesar Ferrari                     *
 * DATA: Novembro/2004                              *
 * ORIENTADOR: Ms. Marcelo Douglas                  *
 * INSTITUI??O:                                     *
 *    FAAr Faculdades Associadas de Ariquemes       *
 ****************************************************
 }

program FonoMouse;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UMaquinaDeReconhecimento in 'UMaquinaDeReconhecimento.pas',
  USAPI in 'USAPI.pas',
  UGrade in 'UGrade.pas' {frmGrade},
  UFerramentas in 'UFerramentas.pas',
  USplash in 'USplash.pas' {frmSplash},
  UAjuda in 'UAjuda.pas' {frmAjuda};

{$R *.res}

begin
frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Refresh;
  frmSplash.lblSplash.Caption := 'Carregando FonoMouse...';
  frmSplash.Refresh;
  Application.ProcessMessages;

  Application.Initialize;
  Application.Title := 'FonoMouse';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
