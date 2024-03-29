{-----------------------------------------------------------------------------
 Unit Name: uCalcoliQuantile.Base
 Author:    muzio valerio
 Date:      31-gen-2023
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit uCalcoliQuantile.Base;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections,
  uCalcoliQuantile.Interfaces;

type
  TCalcoliQuantileBase = class(TInterfacedObject, IQuantile)
  strict private
    function GetElementsCount: Integer;
  private
    FElements: TList<Extended>;
    function GetListElements: TList<Extended>;
    procedure SetListElements(const Value: TList<Extended>);
  public
   constructor Create;
   destructor Destroy; override;

   function ExecuteCalc(const Quantile: Extended): Extended; virtual; abstract;
   property ListElements: TList<Extended> read GetListElements write SetListElements;
    property ElementsCount: Integer read GetElementsCount;

  end;


implementation

{ TCalcoliQuantileBase }

function TCalcoliQuantileBase.GetListElements: TList<Extended>;
begin
  Result := FElements;
end;

procedure TCalcoliQuantileBase.SetListElements(const Value: TList<Extended>);
begin
  FElements := Value;
end;

constructor TCalcoliQuantileBase.Create;
begin
  inherited Create;
  FElements := TList<Extended>.Create;
end;

destructor TCalcoliQuantileBase.Destroy;
begin
  if FElements <> nil then
    FreeAndNil(Felements);

  inherited Destroy;
end;

function TCalcoliQuantileBase.GetElementsCount: Integer;
begin
  Result := FElements.Count;
end;

end.
