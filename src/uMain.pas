unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.NumberBox,
  uCalcoliQuantile.Interfaces;

type
  TFormMain = class(TForm)
    ButtonExit: TButton;
    ButtonCalculate: TButton;
    ComboBoxTipoCalcolo: TComboBox;
    LabelTipoCalcolo: TLabel;
    Label1: TLabel;
    Memo: TMemo;
    ActionList1: TActionList;
    ActionExit: TAction;
    ActionCalculate: TAction;
    NumberBoxValoreQ: TNumberBox;
    LabelValoreQ: TLabel;
    LabelRisultato: TLabel;
    NumberBoxRisultato: TNumberBox;
    NumberBoxConteggio: TNumberBox;
    Labelconteggio: TLabel;
    procedure ActionCalculateExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
  private
    procedure CalculateQuartili(Quartile: IQuantile);
    procedure CalculatePercentili(Percentile: IQuantile);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  uCalcoliQuantile.Quartile,
  uCalcoliQuantile.Percentile;

{$R *.dfm}

procedure TFormMain.ActionCalculateExecute(Sender: TObject);
begin
  if Memo.Lines.ToString.Trim = '' then
    Exit;

  case ComboBoxTipoCalcolo.ItemIndex of
    0: CalculateQuartili(TQuartile.Create);
    1: CalculatePercentili(TPercentile.Create);
  end;
end;

procedure TFormMain.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.CalculatePercentili(Percentile: IQuantile);
begin
  Percentile.ListElements.AddRange([1, 3, 5, 6, 9, 11, 12, 13, 19, 21, 22, 32, 35, 36, 45, 44,
   55, 68, 79, 80, 81, 88, 90, 91, 92, 100, 112, 113, 114, 120, 121, 132, 145, 146, 149, 150, 155, 180, 189, 190]);
  NumberBoxRisultato.ValueFloat := Percentile.ExecuteCalc(NumberBoxValoreQ.ValueFloat);
  NumberBoxConteggio.ValueInt := Percentile.ElementsCount;
end;

procedure TFormMain.CalculateQuartili(Quartile: IQuantile);
begin
  Quartile.ListElements.AddRange([1, 3, 5, 6, 9, 11, 12, 13, 19, 21, 22, 32, 35, 36, 45, 44,
   55, 68, 79, 80, 81, 88, 90, 91, 92, 100, 112, 113, 114, 120, 121, 132, 145, 146, 149, 150, 155, 180, 189, 190]);
  NumberBoxRisultato.ValueFloat := Quartile.ExecuteCalc(NumberBoxValoreQ.ValueFloat);
  NumberBoxConteggio.ValueInt := Quartile.ElementsCount;
end;

end.
