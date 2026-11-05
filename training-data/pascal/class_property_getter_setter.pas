program ClassPropertyGetterSetter;
{$mode objfpc}
type
  TTemp = class
  private
    FC: Double;
    procedure SetC(V: Double);
  public
    property Celsius: Double read FC write SetC;
    function Fahrenheit: Double;
  end;

procedure TTemp.SetC(V: Double);
begin
  if V < -273.15 then FC := -273.15 else FC := V;
end;

function TTemp.Fahrenheit: Double;
begin
  Result := FC * 9 / 5 + 32;
end;

var T: TTemp;
begin
  T := TTemp.Create;
  T.Celsius := 100;
  WriteLn(T.Fahrenheit:0:1);
  T.Celsius := -500;
  WriteLn(T.Celsius:0:2);
  T.Free;
end.
