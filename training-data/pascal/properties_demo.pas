program PropertiesDemo;

{$mode objfpc}

type
  TTemperature = class
  private
    FCelsius: Double;
    procedure SetCelsius(V: Double);
    function GetFahrenheit: Double;
  public
    property Celsius: Double read FCelsius write SetCelsius;
    property Fahrenheit: Double read GetFahrenheit;
  end;

procedure TTemperature.SetCelsius(V: Double);
begin
  if V < -273.15 then V := -273.15;
  FCelsius := V;
end;

function TTemperature.GetFahrenheit: Double;
begin
  Result := FCelsius * 9 / 5 + 32;
end;

var
  t: TTemperature;
begin
  t := TTemperature.Create;
  t.Celsius := 100;
  WriteLn(t.Fahrenheit:0:1);
  t.Celsius := -500;
  WriteLn(t.Celsius:0:2);
  t.Free;
end.
