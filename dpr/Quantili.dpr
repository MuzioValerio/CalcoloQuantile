program Quantili;

uses
  Vcl.Forms,
  uMain in '..\src\uMain.pas' {FormMain},
  uCalcoliQuantile.Interfaces in '..\src\uCalcoliQuantile.Interfaces.pas',
  uCalcoliQuantile.Base in '..\src\uCalcoliQuantile.Base.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
