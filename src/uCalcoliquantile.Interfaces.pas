{-----------------------------------------------------------------------------
 Unit Name: uCalcoliQuantile.Interfaces
 Author:    muzio valerio
 Date:      31-gen-2023
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uCalcoliQuantile.Interfaces;

interface

uses
  System.Generics.Collections;

type
  IQuantile = interface(IInterface)
  ['{203DA6FA-3CBF-478C-8246-794C5D92E7D5}']
    function ExecuteCalc(const Quantile: Extended): Extended;
    function GetListElements: TList<Extended>;
    procedure SetListElements(const AValue: TList<Extended>);
    function GetElementsCount: Integer;
    property ListElements: TList<Extended> read GetListElements write SetListElements;
    property ElementsCount: Integer read GetElementsCount;
  end;



implementation

end.
