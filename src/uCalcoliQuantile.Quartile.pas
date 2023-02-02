unit uCalcoliQuantile.Quartile;

interface

uses
  System.Classes, System.SysUtils, System.Math, System.Generics.Collections,
  uCalcoliQuantile.Base;

type
  TQuartile = class(TCalcoliQuantileBase)
  strict private
    function GetElementsCount: Integer;
  private
    FElementsSorted: TList<Extended>;
    FElementsCount: Integer;
    /// <summary>
    ///  Calcolo dei Primo Quartile
    ///  Posizione all'interno della Serie ordinata h := N div 4
    ///  dove N è il numero di elementi nella serie ordinata.
    ///  se N mod 4 = 0
    ///     per ottenere il primo quartile
    ///     cercheremo nella serie ordinata il valore in posizione h
    ///     poi cercheremo nella serie ordinata il valore in posizione h+1
    ///     PrimoQuartile := (Y di h) + (Y di h + 1)/2;
    ///     dove Y è il valore nella serie alla posizione hesima.
    ///  se N mod 4 <> 0
    ///     per ottenere il primo quartile
    ///     cercheremo nella serie il valore in posizione h+1
    ///     PrimoQuartile := Y di h+1;
    ///     dove Y è il valore nella serie alla posizione hesima + 1.
    /// </summary>
    function PrimoQuartile: Extended;
    /// <summary>
    ///  Calcolo della mediana di una serie ordinata
    ///  Se il numero di elementi della serie è dispari
    ///  il valore dell'elemento mediano sarà dato da:
    ///     h = (N+1) div 2; dove N è il numero di elementi
    ///     Mediana := Y di h. dove Y è il valore nella posizione hesima della serie.
    ///  Se il numero di elementi della serie è pari
    ///  allora il valore dell'elemento mediano sarà dato da:
    ///     h := N div 2; do ve N è il numero di elementi
    ///     Mediana = ((Y in h) + (Y in h+1))/2; Y di h è il valore nella posizione hesima della serie,
    ///  e Y di h+1 è il valore nella posizione hesima + 1 della serie.
    /// </summary>
    function Mediana: Extended;
    /// <summary>
    ///  Calcolo dei Terzo Quartile
    ///  Posizione all'interno della Serie ordinata h := (N*3) div 4
    ///  dove N è il numero di elementi nella serie ordinata.
    ///  se (N*3) mod 4 = 0
    ///     per ottenere il terzo quartile
    ///     cercheremo nella serie ordinata il valore in posizione h
    ///     poi cercheremo nella serie ordinata il valore in posizione h+1
    ///     TerzoQuartile := (Y di h) + (Y di h + 1)/2;
    ///     dove Y è il valore nella serie alla posizione hesima.
    ///  se (N*3) mod 4 <> 0
    ///     per ottenere il terzo quartile
    ///     cercheremo nella serie il valore in posizione h+1
    ///     TerzoQuartile := Y di h+1;
    ///     dove Y è il valore nella serie alla posizione hesima + 1.
    /// </summary>
    function TerzoQuartile: Extended;
    procedure SortingElements;
  public
    function ExecuteCalc(const Quantile: Extended): Extended; override;
    constructor Create;
    property ElementsCount: Integer read GetElementsCount;
  end;


implementation

{ TQuartile }

function TQuartile.ExecuteCalc(const Quantile: Extended): Extended;
begin
  Result := 0;
  if self.ListElements.Count = 0 then
    Exit;

  SortingElements;
  if Quantile = 0.25 then
    Result := PrimoQuartile
  else if Quantile = 0.5 then
    Result := Mediana
  else if Quantile = 0.75 then
    Result := TerzoQuartile;
end;

function TQuartile.PrimoQuartile: Extended;
begin
  var hPos: Integer := FElementsCount div 4;
  if FElementsCount mod 4 = 0 then
  begin
    var lElementInhPos := FElementsSorted[hPos-1];
    var lElementInhPosSucc := FElementsSorted[hPos];
    Result := (lElementinhPos + lElementinhPosSucc)/2;
  end
  else
    Result := FElementsSorted[hPos];
end;

function TQuartile.Mediana: Extended;
var
  hPos: Integer;
begin
  if Odd(FElementsCount) then
  begin
    hPos := (FElementsCount + 1) div 2;
    Result := FElementsSorted[hPos-1];
  end
  else
  begin
    hPos := FElementsCount div 2;
    var lElementInhPos := FElementsSorted[hPos-1];
    var lElementInhPosSucc := FElementsSorted[hPos];
    Result := (lElementinhPos + lElementinhPosSucc)/2;
  end;
end;

function TQuartile.TerzoQuartile: Extended;
begin
  var hPos: Integer := (FElementsCount*3) div 4;
  if (FElementsCount*3) mod 4 = 0 then
  begin
    var lElementInhPos := FElementsSorted[hPos-1];
    var lElementInhPosSucc := FElementsSorted[hPos];
    Result := (lElementinhPos + lElementinhPosSucc)/2;
  end
  else
    Result := FElementsSorted[hPos];
end;

constructor TQuartile.Create;
begin
  inherited Create;
  FElementsSorted := TList<Extended>.Create;
end;

procedure TQuartile.SortingElements;
begin
  FElementsSorted := self.ListElements;
  FElementsSorted.Sort;
  FElementsCount := FElementsSorted.Count;
end;

function TQuartile.GetElementsCount: Integer;
begin
  Result := FElementsCount;
end;

end.
