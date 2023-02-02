{-----------------------------------------------------------------------------
 Unit Name: uCalcoliQuantile.Percentile
 Author:    muzio1
 Date:      01-feb-2023
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uCalcoliQuantile.Percentile;

interface

uses
  System.Classes, System.SysUtils, System.Math, System.Generics.Collections,
  uCalcoliQuantile.Base;

type
  TPercentile = class(TCalcoliQuantileBase)
  strict private
    function GetElementsCount: Integer;
  private
    FElementsCount: Integer;
    FElementsSorted: TList<Extended>;
    FQuantile: Extended;
    procedure SortingElements;
    function Percentile: Extended;
  public
    /// <summary>
    ///   Calcolo del Percentile data una serie non ordinata;
    /// </summary>
    function ExecuteCalc(const Quantile: Extended): Extended; override;
    property ElementsCount: Integer read GetElementsCount;
  end;


implementation

{ TPercentile }

function TPercentile.ExecuteCalc(const Quantile: Extended): Extended;
begin
  Result := 0;
  if self.ListElements.Count = 0 then
    Exit;
  FQuantile := Quantile;
  SortingElements;
  Result := Percentile;
end;

function TPercentile.Percentile: Extended;
var
  hPosInt: Integer;
begin
  var hPos: Extended := FQuantile * (FElementsCount + 1);
  hPosInt := Trunc(hPos);

  Result := FElementsSorted[hPosInt-1];
end;

procedure TPercentile.SortingElements;
begin
  FElementsSorted := self.ListElements;
  FElementsSorted.Sort;
  FElementsCount := FElementsSorted.Count;
end;

function TPercentile.GetElementsCount: Integer;
begin
  Result := FElementsCount;
end;

end.
