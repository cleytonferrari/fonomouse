unit UMaquinaDeReconhecimento;

interface
uses
   ActiveX,
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, OleServer, SpeechLib_TLB;



//Fun??es e Procedimentos
function GetPropValue(SRResult: ISpeechRecoResult;
  const Path: array of String): OleVariant;
function GetProp(Props: ISpeechPhraseProperties;
  const Name: String): ISpeechPhraseProperty;
procedure CriarMaquina(Maq:TSpSharedRecoContext; CaminhoXML:String);


var
 SRGrammar: ISpeechRecoGrammar;

implementation

uses UPrincipal;
//Implementa??o dos Procedimentos e Fun??es

function GetPropValue(SRResult: ISpeechRecoResult;
  const Path: array of String): OleVariant;
var
  Prop: ISpeechPhraseProperty;
  PathLoop: Integer;
begin
  for PathLoop := Low(Path) to High(Path) do
  begin
    if PathLoop = Low(Path) then
      Prop := GetProp(SRResult.PhraseInfo.Properties, Path[PathLoop])
    else
      Prop := GetProp(Prop.Children, Path[PathLoop]);
    if not Assigned(Prop) then
    begin
      Result := Unassigned;
      Exit;
    end
  end;
  Result := Prop.Value
end;
//*****************************************************************************
function GetProp(Props: ISpeechPhraseProperties;
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
//*****************************************************************************
procedure CriarMaquina(Maq:TSpSharedRecoContext; CaminhoXML:String);
begin
//Procedimento para criar o objeto da Maquina de Reconhecimento
  Maq.EventInterests := SREAllEvents;
  SRGrammar := Maq.CreateGrammar(0);
  SRGrammar.CmdLoadFromFile(CaminhoXML, SLODynamic);
  SRGrammar.CmdSetRuleIdState(0, SGDSActive);
end;
//*****************************************************************************
end.
