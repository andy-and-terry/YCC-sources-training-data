{$mode objfpc}{$H+}
program ClassInheritanceSuperDemo;

uses SysUtils;

type
  TVehicle = class
  protected
    FWheels: Integer;
  public
    constructor Create; virtual;
    function Describe: string; virtual;
  end;

  TBike = class(TVehicle)
  public
    constructor Create; override;
    function Describe: string; override;
  end;

constructor TVehicle.Create;
begin
  FWheels := 4;
end;

function TVehicle.Describe: string;
begin
  Result := 'vehicle with ' + IntToStr(FWheels) + ' wheels';
end;

constructor TBike.Create;
begin
  inherited Create;
  FWheels := 2;
end;

function TBike.Describe: string;
begin
  Result := 'bike, a kind of ' + inherited Describe;
end;

var
  v: TVehicle;
begin
  v := TVehicle.Create;
  WriteLn(v.Describe);
  v.Free;
  v := TBike.Create;
  WriteLn(v.Describe);
  v.Free;
end.
