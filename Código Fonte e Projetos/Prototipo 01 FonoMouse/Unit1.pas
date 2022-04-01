unit Unit1;

interface

uses
  ActiveX,
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, OleServer, SpeechLib_TLB, Menus, Buttons,
  ExtCtrls, Gauges, jpeg;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    SpSharedRecoContext2: TSpSharedRecoContext;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TMovimentos: TTimer;
    Label15: TLabel;
    EditMs: TEdit;
    btnMenosMS: TButton;
    btnMaisMS: TButton;
    RBrapido: TRadioButton;
    RBSalto: TRadioButton;
    Bevel4: TBevel;
    Label16: TLabel;
    btnMenosPixel: TButton;
    btnMaisPixel: TButton;
    EditPixel: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);

    function GetPropValue(SRResult: ISpeechRecoResult;
           const Path: array of String): OleVariant;
    function GetProp(Props: ISpeechPhraseProperties;
          const Name: String): ISpeechPhraseProperty; overload;
    procedure FormShow(Sender: TObject);
    procedure SpSharedRecoContext2AudioLevel(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      AudioLevel: Integer);
    procedure SpSharedRecoContext2Recognition(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      RecognitionType: TOleEnum; const Result: ISpeechRecoResult);
    procedure Button1Click(Sender: TObject);
   procedure InvokeUI(const TypeOfUI, Caption: WideString);
    procedure TMovimentosTimer(Sender: TObject);
    procedure btnMaisMSClick(Sender: TObject);
    procedure btnMenosMSClick(Sender: TObject);
    procedure RBrapidoClick(Sender: TObject);
    procedure RBSaltoClick(Sender: TObject);
    procedure btnMaisPixelClick(Sender: TObject);
    procedure btnMenosPixelClick(Sender: TObject);


  private
    { Private declarations }
    SRGrammar: ISpeechRecoGrammar;


  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Posicao:Integer;
  VeloMs, VeloPixel : Integer;
  Salto:Boolean;

implementation

uses USAPI;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  VeloMs:=30;
  VeloPixel:=10;
  Posicao:=0;
  Salto:=False;
  
  //Procedimento para criar o objeto
  SpSharedRecoContext2.EventInterests := SREAllEvents;
  SRGrammar := SpSharedRecoContext2.CreateGrammar(0);
  SRGrammar.CmdLoadFromFile('XML_Comandos.xml', SLODynamic);
  SRGrammar.CmdSetRuleIdState(0, SGDSActive);
end;

function TForm1.GetProp(Props: ISpeechPhraseProperties;
  const Name: String): ISpeechPhraseProperty;
var
  I: Integer;
  Prop: ISpeechPhraseProperty;
begin
  Result := nil;
  for I := 0 to Props.Count - 1 do
  begin
    Prop := Props.Item(I);
    if CompareText(Prop.Name, Name) = 0 then
    begin
      Result := Prop;
      Break
    end
  end
end;

function TForm1.GetPropValue(SRResult: ISpeechRecoResult;
  const Path: array of String): OleVariant;
var
  Prop: ISpeechPhraseProperty;
  PathLoop: Integer;
begin
  for PathLoop := Low(Path) to High(Path) do
  begin
    if PathLoop = Low(Path) then //top level property
      Prop := GetProp(SRResult.PhraseInfo.Properties, Path[PathLoop])
    else //nested property
      Prop := GetProp(Prop.Children, Path[PathLoop]);
    if not Assigned(Prop) then
    begin
      Result := Unassigned;
      Exit;
    end
  end;
  Result := Prop.Value

end;


procedure TForm1.FormShow(Sender: TObject);
begin
 ProgressBar1.SetFocus;
end;

procedure TForm1.SpSharedRecoContext2AudioLevel(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer);
begin
  ProgressBar1.Position := AudioLevel;
end;

procedure TForm1.SpSharedRecoContext2Recognition(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  RecognitionType: TOleEnum; const Result: ISpeechRecoResult);
var
 pt:tpoint;
begin
try
 FocusControl(Nil);
 Application.ProcessMessages;
  with Result.PhraseInfo do
  begin
  getcursorpos(pt);
   case GetPropValue(Result, ['chosencolour', 'colourvalue']) of
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
      10: begin  //Liberar Botao Esquerdo
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
    end;
    SetCursorPos(pt.x,pt.y);
    if pt.x>=screen.width-1 then
      SetCursorPos(0,pt.y);
    if pt.y>=screen.height-1 then
      SetCursorPos(pt.x,0);
  end;
except
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //\\Chama a janela de adição de palavra ao dicionario ingles.
  //\\Desabilitada utilizada somente na parte do treinamento da voz.
  InvokeUI(SPDUI_AddRemoveWord, 'Add/Remove Palavra');
end;

procedure TForm1.InvokeUI(const TypeOfUI, Caption: WideString);
var
  U: OleVariant;
begin
//\\Continuação da rotina que chama a janela de adção de palavra.
  U := Unassigned;
  if SpSharedRecoContext2.Recognizer.IsUISupported(TypeOfUI, U) then
    SpSharedRecoContext2.Recognizer.DisplayUI(Handle, Caption, TypeOfUI, U);
end;

procedure TForm1.TMovimentosTimer(Sender: TObject);
var
 pt:tpoint;
begin
  Application.ProcessMessages;
  GetCursorPos(Pt);
  case Posicao of
  1: begin //Esquerda
       pt.x := pt.x - 1;
     end;
  2: begin //Direita
       pt.x := pt.x + 1;
     end;
  3: begin //Baixo
       pt.y := pt.y + 1;
     end;
  4: begin //Cima
      pt.y := pt.y - 1;
     end;
  end;
    SetCursorPos(pt.x,pt.y);
    if pt.x>=screen.width-1 then
      SetCursorPos(0,pt.y);
    if pt.y>=screen.height-1 then
      SetCursorPos(pt.x,0);
end;

procedure TForm1.btnMaisMSClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditMs.Text) + 10) <= 500 then begin
     EditMs.Text := IntToStr(StrToInt(EditMs.Text) + 10);
     VeloMs:= StrToInt(EditMs.Text );
  end;
end;

procedure TForm1.btnMenosMSClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditMs.Text) - 10) >= 10 then begin
     EditMS.Text := IntToStr(StrToInt(EditMs.Text) - 10);
     VeloMs:= StrToInt(EditMs.Text );
  end;
end;

procedure TForm1.RBrapidoClick(Sender: TObject);
begin
  Salto:=False;
end;

procedure TForm1.RBSaltoClick(Sender: TObject);
begin
  Salto:=True;
end;

procedure TForm1.btnMaisPixelClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditPixel.Text) + 1) <= 15 then begin
     EditPixel.Text := IntToStr(StrToInt(EditPixel.Text) + 1);
     VeloPixel:= StrToInt(EditPixel.Text );
  end;
end;

procedure TForm1.btnMenosPixelClick(Sender: TObject);
begin
  FocusControl(nil);
  if (StrToInt(EditPixel.Text) - 1) >= 1 then begin
     EditPixel.Text := IntToStr(StrToInt(EditPixel.Text) - 1);
     VeloPixel:= StrToInt(EditPixel.Text );
  end;
end;

end.





