unit UFerramentas;

interface
uses
  Windows, Messages, IniFiles, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

  procedure GravaIni(Modo: Boolean; Modo_Continuo:Integer; Modo_Salto:Integer; Exibir_Grade:Boolean; Cor_Grade:Integer);
  procedure GetBuildInfo(var v1, v2, v3, v4: word);
  function GetVersionInfo: String;

implementation

procedure GravaIni(Modo: Boolean; Modo_Continuo:Integer; Modo_Salto:Integer; Exibir_Grade:Boolean; Cor_Grade:Integer);
var
  ArqIni : TIniFile;
begin
  ArqIni := TIniFile.Create(GetCurrentDir+'\FonoMouse.Ini');
  Try
    //Configuração do Mouse
    ArqIni.WriteBool('ConfiguracaoMOUSE','Modo',Modo);
    ArqIni.WriteInteger('ConfiguracaoMOUSE','Modo_Continuo',Modo_Continuo);
    ArqIni.WriteInteger('ConfiguracaoMOUSE','Modo_Salto',Modo_Salto);
    //Configuração da Grade
    ArqIni.WriteBool('ConfiguracaoGRADE','Exibir_Grade',Exibir_Grade);
    ArqIni.WriteInteger('ConfiguracaoGRADE','Cor_Grade',Cor_Grade);
  Finally
    ArqIni.Free;
  end;
end;

procedure GetBuildInfo(var v1, v2, v3, v4: word);
Var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize:= GetFileVersionInfoSize(PChar(ParamStr(0)),Dummy);
  GetMem(VerInfo,VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)),0,VerInfoSize,VerInfo);
  VerQueryValue(VerInfo,'\',Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    v1:= dwFileVersionMS shr 16;
    v2:= dwFileVersionMS and $FFFF;
    v3:= dwFileVersionLS shr 16;
    v4:= dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function GetVersionInfo: String;
Var
  v1,v2,v3,v4 : Word;
begin
  GetBuildInfo(v1,v2,v3,v4);
  Result:= IntToStr(v1) + '.'
     + IntToStr(v2) + '.'
     + IntToStr(v3) + '.'
     + IntToStr(v4);
end;

end.
