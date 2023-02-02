program Quantili;

uses
  Vcl.Forms,
  uMain in '..\src\uMain.pas' {FormMain},
  uCalcoliQuantile.Interfaces in '..\src\uCalcoliQuantile.Interfaces.pas',
  uCalcoliQuantile.Base in '..\src\uCalcoliQuantile.Base.pas',
  uCalcoliQuantile.Quartile in '..\src\uCalcoliQuantile.Quartile.pas',
  uCalcoliQuantile.Percentile in '..\src\uCalcoliQuantile.Percentile.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
