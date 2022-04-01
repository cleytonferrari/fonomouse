unit UPrincipal;

interface

uses
  ActiveX,
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxfShapedForm, JvComponent, JvMagnet, JvTransLED,
  dxfProgressBar, OleServer, SpeechLib_TLB, Buttons, StdCtrls, JvMemo,
  JvColorBox, JvColorBtn, JvSystemColors, JvaScrollText, dxfCheckBox,
  dxfPictureButton, dxfComboBox, JvMousePositionner, JvTrayIcon, Menus,
  ImgList,IniFiles, JvBaseThumbnail, JvThumbImage, JvButton, JvButtonShaped,
  JvxCtrls, JvxAnimate, JvGIFCtrl;

type
  TfrmPrincipal = class(TForm)
    dxfShapedForm1: TdxfShapedForm;
    JvFormMagnet1: TJvFormMagnet;
    NB: TNotebook;
    BrAudio: TdxfProgressBar;
    Led: TJvTransLED;
    Image1: TImage;
    Maquina: TSpSharedRecoContext;
    TMovimentos: TTimer;
    RBrapido: TRadioButton;
    RBSalto: TRadioButton;
    EditMS: TEdit;
    EditPixel: TEdit;
    btnMenosMS: TSpeedButton;
    btnMaisMS: TSpeedButton;
    BtnMenosPixel: TSpeedButton;
    BtnMaisPixel: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Okajuda: TSpeedButton;
    Label7: TLabel;
    SpeedButton7: TSpeedButton;
    Label9: TLabel;
    SpeedButton8: TSpeedButton;
    JvTrayIcon1: TJvTrayIcon;
    MenuTrayIcon: TPopupMenu;
    FinalizarFonoMouse1: TMenuItem;
    ExibirPainelPrincipal1: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    rbAzul: TdxfCheckBox;
    rbPreto: TdxfCheckBox;
    rbVerde: TdxfCheckBox;
    rbVermelho: TdxfCheckBox;
    rbAmarelo: TdxfCheckBox;
    cbExibirGradeInicial: TdxfCheckBox;
    cbOcultarGrade: TdxfCheckBox;
    SpeedButton9: TSpeedButton;
    Label11: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    imgFundoConfi: TImage;
    imgFundoAjuda: TImage;
    imgFundoSobre: TImage;
    imgFundoX: TImage;
    mp01BtnConf: TImage;
    mp02BtnConf: TImage;
    mp03BtnConf: TImage;
    mp04BtnConf: TImage;
    mp05BtnConf: TImage;
    mp06BtnConf: TImage;
    mp01BtnSobre: TImage;
    mp02BtnSobre: TImage;
    mp03BtnSobre: TImage;
    mp04BtnSobre: TImage;
    mp05BtnSobre: TImage;
    mp01BtnAjuda: TImage;
    mp02BtnAjuda: TImage;
    mp03BtnAjuda: TImage;
    mp04BtnAjuda: TImage;
    mp05BtnAjuda: TImage;
    mp01BtnX: TImage;
    imgSobre: TImage;
    imgAjuda: TImage;
    imgConf: TImage;
    mp01oculta: TImage;
    mp02oculta: TImage;
    mp03oculta: TImage;
    mp04oculta: TImage;
    mp05oculta: TImage;
    mp06oculta: TImage;
    mp07oculta: TImage;
    mp08oculta: TImage;
    mp09oculta: TImage;
    Image2: TImage;
    TextoSobre: TJvSecretPanel;
    lblVersao: TLabel;
    JvGIFAnimator1: TJvGIFAnimator;
    procedure FormCreate(Sender: TObject);
    procedure MaquinaAudioLevel(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; AudioLevel: Integer);
    procedure MaquinaRecognition(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; RecognitionType: TOleEnum;
      var Result: OleVariant);
    procedure TMovimentosTimer(Sender: TObject);
    procedure btnMenosMSClick(Sender: TObject);
    procedure RBrapidoClick(Sender: TObject);
    procedure RBSaltoClick(Sender: TObject);
    procedure BtnMaisPixelClick(Sender: TObject);
    procedure BtnMenosPixelClick(Sender: TObject);
    procedure btnMaisMSClick(Sender: TObject);
    procedure ChamarAPISpeech(const TypeOfUI, Caption: WideString; Maq:TSpSharedRecoContext);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure OkajudaClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FinalizarFonoMouse1Click(Sender: TObject);
    procedure ExibirPainelPrincipal1Click(Sender: TObject);
    procedure rbVermelhoClick(Sender: TObject);
    procedure rbPretoClick(Sender: TObject);
    procedure rbAzulClick(Sender: TObject);
    procedure rbVerdeClick(Sender: TObject);
    procedure rbAmareloClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbExibirGradeInicialClick(Sender: TObject);
    procedure cbOcultarGradeClick(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure MaquinaSoundStart(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant);
    procedure MaquinaFalseRecognition(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      var Result: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mp01BtnConfClick(Sender: TObject);
    procedure mp01BtnConfMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mp01BtnSobreClick(Sender: TObject);
    procedure mp01BtnSobreMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mp01BtnAjudaClick(Sender: TObject);
    procedure mp01BtnAjudaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mp01BtnXClick(Sender: TObject);
    procedure mp01BtnXMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mp01ocultaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dxfShapedForm1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Posicao:Integer;
  VeloMs, VeloPixel : Integer;
  Salto:Boolean;
  CorGrade:TColor;
  ExibirGradeIniciar:Boolean;
  //novo ok
  TimerOK:Integer;
implementation

uses UMaquinaDeReconhecimento, USAPI, UGrade, UFerramentas, USplash, UAjuda;

{$R *.dfm}
//Para que possa ser manifestado o StiloWindowsXP dos Componentes
{$R WindowsXP.res}

{ TForm1 }


procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  ArqIni : TIniFile;
begin
 CriarMaquina(Maquina,'FonoMouse.xml');

    ArqIni := TIniFile.Create(GetCurrentDir+'\FonoMouse.Ini');

  Try
    If Not (fileexists(GetCurrentDir+'\FonoMouse.Ini')) then
     begin
      //Configuração do Mouse
      ArqIni.WriteBool('ConfiguracaoMOUSE','Modo',False);
      ArqIni.WriteInteger('ConfiguracaoMOUSE','Modo_Continuo',20);
      ArqIni.WriteInteger('ConfiguracaoMOUSE','Modo_Salto',10);
      //Configuração da Grade
      ArqIni.WriteBool('ConfiguracaoGRADE','Exibir_Grade',False);
      ArqIni.WriteInteger('ConfiguracaoGRADE','Cor_Grade',1);
     end;
  Finally
    ArqIni.Free;
  end;

 frmPrincipal.Top:=390;
 frmPrincipal.Left:=350;
end;

procedure TfrmPrincipal.MaquinaAudioLevel(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer);
begin
  BrAudio.Position:= AudioLevel;
  if AudioLevel > 75 then
    Led.Color := clRed
  else
    Led.Color := clLime;
end;

procedure TfrmPrincipal.MaquinaRecognition(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  RecognitionType: TOleEnum; var Result: OleVariant);
var
  SRResult: ISpeechRecoResult;
  pt:tpoint;
begin
try
  FocusControl(Nil);
  Application.ProcessMessages;
  SRResult := IDispatch(Result) as ISpeechRecoResult;
  with SRResult.PhraseInfo do
  getcursorpos(pt);
  begin
    case GetPropValue(SRResult, ['MudarEvento', 'EventoValor']) of
      1: begin //esquerda
          if Salto = False then begin
           Posicao:=1;
           TMovimentos.Interval := VeloMs;
          end else
           pt.x := pt.x - VeloPixel;
         end;
      2: begin //direita
          if Salto = False then begin
           Posicao:=2;
           TMovimentos.Interval := VeloMs;
          end else
           pt.x := pt.x + VeloPixel;
         end;
      3: begin //baixo
          if Salto = False then begin
           Posicao:=3;
           TMovimentos.Interval := VeloMs;
          end else
           pt.y := pt.y + VeloPixel;
         end;
      4: begin //cima
         if Salto = False then begin
           Posicao:=4;
           TMovimentos.Interval := VeloMs;
          end else
           pt.y := pt.y - VeloPixel;
         end;
      5: begin //Botao direito
          Application.ProcessMessages;
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTDOWN, Pt.x, Pt.y, 0, 0);
          { Simula soltando o botão direito do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTUP, Pt.x, Pt.y, 0, 0);
         end;
      6: begin  //Botão esquerdo
          Application.ProcessMessages;
          {Simula o pressionamento do botão esquerdo do mouse}
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
          { Simula soltando o botão esquerdo do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);
         end;
      7: begin  //Pressionar Botao Direito
          Application.ProcessMessages;
          {Simula o pressionamento do botão direito do mouse}
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTDOWN, Pt.x, Pt.y, 0, 0);
         end;
      8: begin  //Pressionar Botao Esquerdo
          Application.ProcessMessages;
          {Simula o pressionamento do botão esquerdo do mouse}
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
         end;
      9: begin  //Liberar Botao direito
          { Simula soltando o botão direito do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTUP, Pt.x, Pt.y, 0, 0);
         end;
     10: begin  //Liberar Botao esquerdo
          { Simula soltando o botão esquerdo do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);
         end;
      11: begin  //Duplo Clique Botao Direito
          Application.ProcessMessages;
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTDOWN, Pt.x, Pt.y, 0, 0);
          { Simula soltando o botão direito do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTUP, Pt.x, Pt.y, 0, 0);

          Application.ProcessMessages;
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTDOWN, Pt.x, Pt.y, 0, 0);
          { Simula soltando o botão direito do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTUP, Pt.x, Pt.y, 0, 0);
         end;
      12: begin  //Duplo clique Botao Esquerdo
         Application.ProcessMessages;
          {Simula o pressionamento do botão esquerdo do mouse}
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
          { Simula soltando o botão esquerdo do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);

          Application.ProcessMessages;
          {Simula o pressionamento do botão esquerdo do mouse}
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
          { Simula soltando o botão esquerdo do mouse }
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);
         end;
      13: begin  //Ok
           TMovimentos.Interval := 0;
         end;
      14: begin  //Modo Rápido
           RBrapidoClick(Self);
           RBrapido.Checked := True;
         end;
      15: begin  //Modo Salto
           RBSaltoClick(Self);
           RBSalto.Checked := True;
         end;
     16: begin //A1
          pt.x := 133; pt.y := 100;
         end;
     17: begin //A2
          pt.x := 399; pt.y := 100;
         end;
     18: begin //A3
          pt.x := 655; pt.y := 100;
         end;
     19: begin //B1
          pt.x := 133; pt.y := 300;
         end;
     20: begin //B2
          pt.x := 399; pt.y := 300;
         end;
     21: begin //B3
          pt.x := 655; pt.y := 300;
         end;
     22: begin //C1
          pt.x := 133; pt.y := 500;
         end;
     23: begin //C2
          pt.x := 399; pt.y := 500;
         end;
     24: begin //C3
          pt.x := 655; pt.y := 500;
         end;
    end;
    SetCursorPos(pt.x,pt.y);
    if pt.x>=screen.width-1 then
      SetCursorPos(0,pt.y);
    if pt.y>=screen.height-1 then
      SetCursorPos(pt.x,0);
  end;

  except
  //tratar erros
  end;

end;

procedure TfrmPrincipal.TMovimentosTimer(Sender: TObject);
var
 pt:tpoint;
begin
  Application.ProcessMessages;
  GetCursorPos(Pt);
  case Posicao of
  1: begin //Esquerda
       //este if faz ele sumir da esquerda e aparecer na direita
       if pt.X = 0  then
         pt.X:=799;

       pt.x := pt.x - 1;
     end;
  2: begin //Direita
       pt.x := pt.x + 1;
     end;
  3: begin //Baixo
       pt.y := pt.y + 1;
     end;
  4: begin //Cima
  //este if faz ele sumir de cima e aparecer em baixo
       if pt.Y = 0 then
         pt.Y := 599;
       pt.y := pt.y - 1;
     end;
  end;
    SetCursorPos(pt.x,pt.y);
    if (pt.x >= screen.width-1) then
      SetCursorPos(0,pt.y);
    if (pt.y >= screen.height-1) then
      SetCursorPos(pt.x,0);
end;

procedure TfrmPrincipal.btnMenosMSClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditMs.Text) - 10) >= 10 then begin
     EditMS.Text := IntToStr(StrToInt(EditMs.Text) - 10);
     VeloMs:= StrToInt(EditMs.Text );
  end;
end;

procedure TfrmPrincipal.RBrapidoClick(Sender: TObject);
begin
  Salto:=False;
end;

procedure TfrmPrincipal.RBSaltoClick(Sender: TObject);
begin
Salto:=True;
end;

procedure TfrmPrincipal.BtnMaisPixelClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditPixel.Text) + 1) <= 30 then begin
     EditPixel.Text := IntToStr(StrToInt(EditPixel.Text) + 1);
     VeloPixel:= StrToInt(EditPixel.Text );
  end;
end;

procedure TfrmPrincipal.BtnMenosPixelClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditPixel.Text) - 1) >= 1 then begin
     EditPixel.Text := IntToStr(StrToInt(EditPixel.Text) - 1);
     VeloPixel:= StrToInt(EditPixel.Text );
  end;
end;

procedure TfrmPrincipal.btnMaisMSClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditMs.Text) + 10) <= 500 then begin
     EditMs.Text := IntToStr(StrToInt(EditMs.Text) + 10);
     VeloMs:= StrToInt(EditMs.Text );
  end;
end;

procedure TfrmPrincipal.ChamarAPISpeech(const TypeOfUI, Caption: WideString;
  Maq: TSpSharedRecoContext);
var
  U: OleVariant;
begin
  U := Unassigned;
  if Maq.Recognizer.IsUISupported(TypeOfUI, U) then
    Maq.Recognizer.DisplayUI(Handle, Caption, TypeOfUI, U)
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  NB.ActivePage := 'ConfMouse';
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  NB.ActivePage := 'Inicial';
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  NB.ActivePage:='ConfGrade';
end;

procedure TfrmPrincipal.OkajudaClick(Sender: TObject);
begin
  NB.ActivePage := 'Inicial';
end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
  NB.ActivePage := 'Inicial';
end;

procedure TfrmPrincipal.SpeedButton8Click(Sender: TObject);
begin
  NB.ActivePage:='Configuracoes';
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  NB.ActivePage := 'Configuracoes';
end;

procedure TfrmPrincipal.FinalizarFonoMouse1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.ExibirPainelPrincipal1Click(Sender: TObject);
begin
  Application.Restore;
end;

procedure TfrmPrincipal.rbVermelhoClick(Sender: TObject);
begin
  corgrade:= clRed;
  if frmGrade <> nil then
    frmGrade.Color := corgrade;
end;

procedure TfrmPrincipal.rbPretoClick(Sender: TObject);
begin
  CorGrade:=clBlack;
  if frmGrade <> nil then
    frmGrade.Color := corgrade;
end;

procedure TfrmPrincipal.rbAzulClick(Sender: TObject);
begin
  CorGrade:=clBlue;
  if frmGrade <> nil then
    frmGrade.Color := corgrade;
end;

procedure TfrmPrincipal.rbVerdeClick(Sender: TObject);
begin
 CorGrade:=clLime;
  if frmGrade <> nil then
    frmGrade.Color := corgrade;
end;

procedure TfrmPrincipal.rbAmareloClick(Sender: TObject);
begin
  CorGrade:=clYellow;
  if frmGrade <> nil then
    frmGrade.Color := corgrade;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  ArqIni : tIniFile;
  CorInt:Integer;
begin
  corInt:=1;
  lblVersao.Caption :='(Vs. '+GetVersionInfo+')';

  ArqIni := tIniFile.Create(GetCurrentDir+'\FonoMouse.Ini');
  Try
   VeloMS := ArqIni.ReadInteger('ConfiguracaoMOUSE','Modo_Continuo',VeloMS);
   VeloPixel:= ArqIni.ReadInteger('ConfiguracaoMOUSE','Modo_Salto',VeloPixel);
   Salto := ArqIni.ReadBool('ConfiguracaoMOUSE','Modo',Salto);
   ExibirGradeIniciar:= ArqIni.ReadBool('ConfiguracaoGRADE','Exibir_Grade',ExibirGradeIniciar);
   CorInt:= ArqIni.ReadInteger('ConfiguracaoGRADE','Cor_Grade',CorInt);
  Finally
   ArqIni.Free;
  end;
  //Atualizando interface
  RBSalto.Checked := Salto;
  EditMS.Text := intToStr(VeloMS);
  EditPixel.Text := intToStr(VeloPixel);

  Posicao:=0;
  //Configura a cor da Grade
  Case CorInt of
   1: begin
       CorGrade:= clred;
       rbVermelho.Checked:=True;
      end;
   2: begin
       CorGrade:= clBlack;
       rbPreto.Checked := True;
      end;
   3: begin
       CorGrade:= clBlue;
       rbAzul.Checked := True;
      end;
   4: begin
       CorGrade:= clLime;
       rbVerde.Checked := True;
      end;
   5: begin
       CorGrade:= clYellow;
       rbAmarelo.Checked := True;
      end;
  end;

  cbOcultarGrade.Checked := not ExibirGradeIniciar;
  cbExibirGradeInicial.Checked:=ExibirGradeIniciar;
  if ExibirGradeIniciar = True then begin
    frmGrade := TfrmGrade.Create(Application);
    frmgrade.Transparente.Active := true;
    frmGrade.FormStyle:= fsStayOnTop;
    frmGrade.Color := CorGrade;
    frmGrade.Show;
  end;

  //form splash
  frmSplash.Visible := False;
  frmSplash.Release;
  frmSplash:= nil;

end;

procedure TfrmPrincipal.cbExibirGradeInicialClick(Sender: TObject);
begin
 if frmGrade = nil then begin
    frmGrade := TfrmGrade.Create(Application);
    frmgrade.Transparente.Active := true;
    frmGrade.FormStyle:= fsStayOnTop;
    frmGrade.Color := CorGrade;
    frmGrade.Show;
 end;
 ExibirGradeIniciar := True;
 //0000
 CriarMaquina(Maquina,'FonoMouse.xml');
 //00000
end;

procedure TfrmPrincipal.cbOcultarGradeClick(Sender: TObject);
begin
  if frmGrade <> nil then
    frmGrade.Close;
  ExibirGradeIniciar:=False;
 //0000
 CriarMaquina(Maquina,'FonoMouse2.xml');
 //0000
end;

procedure TfrmPrincipal.SpeedButton16Click(Sender: TObject);
begin
  ChamarAPISpeech(SPDUI_RecoProfileProperties, 'FonoMouse Propriedades do Reconhecimento de Voz',Maquina)
end;

procedure TfrmPrincipal.SpeedButton10Click(Sender: TObject);
begin
  ChamarAPISpeech(SPDUI_MicTraining, 'FonoMouse',Maquina)
end;

procedure TfrmPrincipal.SpeedButton17Click(Sender: TObject);
begin
  NB.ActivePage := 'configuracoes';
end;

procedure TfrmPrincipal.SpeedButton9Click(Sender: TObject);
begin
  NB.ActivePage := 'ConfMic';
end;

procedure TfrmPrincipal.MaquinaSoundStart(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant);
begin
  //Para evitar o atraso do comando, ele é interrompido
  //toda vez que um som é iniciado.(mesmo evendo do Comando OK)
  timerok:=TMovimentos.Interval;
  TMovimentos.Interval := 0;

end;

procedure TfrmPrincipal.MaquinaFalseRecognition(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  var Result: OleVariant);
begin
  //Caso o som pronunciado não seja reconhecido
  //durante a movimentacao do mouse, o sistema dara
  //continuidade ao moviento anterior.
  TMovimentos.Interval := timerok;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
   CorInt:Integer;
begin
 corInt:=1;
  //Muda a cor para inteiro
  Case CorGrade of
   clRed    : CorInt := 1;
   clBlack  : CorInt := 2;
   clBlue   : CorInt := 3;
   clLime   : CorInt := 4;
   clYellow : CorInt := 5;
   end;
   //Armazena as configuraçoes do usuario
  GravaIni(Salto,VeloMs,VeloPixel,ExibirGradeIniciar,CorInt);
end;

procedure TfrmPrincipal.mp01BtnConfClick(Sender: TObject);
begin
  NB.ActivePage := 'Configuracoes';
end;

procedure TfrmPrincipal.mp01BtnConfMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  imgFundoConfi.Visible := False;
  imgFundoSobre.Visible := True;
  imgFundoAjuda.Visible := True;
  imgFundoX.Visible := True;
   
  imgConf.Visible := True;
  imgSobre.Visible := False;
  imgAjuda.Visible := False;
end;

procedure TfrmPrincipal.mp01BtnSobreClick(Sender: TObject);
begin
  NB.ActivePage := 'Sobre';
  TextoSobre.Active := False;
  TextoSobre.Active :=True;
end;

procedure TfrmPrincipal.mp01BtnSobreMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  imgFundoConfi.Visible := True;
  imgFundoSobre.Visible := False;
  imgFundoAjuda.Visible := True;
  imgFundoX.Visible := True;

  imgConf.Visible := False;
  imgSobre.Visible := True;
  imgAjuda.Visible := False;
end;

procedure TfrmPrincipal.mp01BtnAjudaClick(Sender: TObject);
begin
  NB.ActivePage:='Ajuda';
  if frmAjuda = nil then begin
  frmAjuda := TfrmAjuda.Create(application);
  frmAjuda.Show;
  end;
end;

procedure TfrmPrincipal.mp01BtnAjudaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  imgFundoConfi.Visible := True;
  imgFundoSobre.Visible := True;
  imgFundoAjuda.Visible := False;
  imgFundoX.Visible := True;

  imgConf.Visible := False;
  imgSobre.Visible := False;
  imgAjuda.Visible := True;
end;

procedure TfrmPrincipal.mp01BtnXClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.mp01BtnXMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  imgFundoConfi.Visible := True;
  imgFundoSobre.Visible := True;
  imgFundoAjuda.Visible := True;
  imgFundoX.Visible := False;

  imgConf.Visible := False;
  imgSobre.Visible := False;
  imgAjuda.Visible := False;
end;

procedure TfrmPrincipal.mp01ocultaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  imgFundoConfi.Visible := True;
  imgFundoSobre.Visible := True;
  imgFundoAjuda.Visible := True;
  imgFundoX.Visible := True;

  imgConf.Visible := False;
  imgSobre.Visible := False;
  imgAjuda.Visible := False;
end;

procedure TfrmPrincipal.dxfShapedForm1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  imgFundoConfi.Visible := True;
  imgFundoSobre.Visible := True;
  imgFundoAjuda.Visible := True;
  imgFundoX.Visible := True;

  imgConf.Visible := False;
  imgSobre.Visible := False;
  imgAjuda.Visible := False;
end;

end.
