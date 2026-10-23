program ClassOperatorDemo;

{$mode objfpc}{$H+}
{$modeswitch advancedrecords}

uses SysUtils;

type
  TMoney = record
    Cents: Int64;
    class operator + (a, b: TMoney): TMoney;
    class operator - (a, b: TMoney): TMoney;
    class operator * (a: TMoney; k: Integer): TMoney;
    class operator = (a, b: TMoney): Boolean;
    class operator < (a, b: TMoney): Boolean;
    class operator Implicit(a: Integer): TMoney;
    function ToString: string;
  end;

class operator TMoney.+ (a, b: TMoney): TMoney;
begin
  Result.Cents := a.Cents + b.Cents;
end;

class operator TMoney.- (a, b: TMoney): TMoney;
begin
  Result.Cents := a.Cents - b.Cents;
end;

class operator TMoney.* (a: TMoney; k: Integer): TMoney;
begin
  Result.Cents := a.Cents * k;
end;

class operator TMoney.= (a, b: TMoney): Boolean;
begin
  Result := a.Cents = b.Cents;
end;

class operator TMoney.< (a, b: TMoney): Boolean;
begin
  Result := a.Cents < b.Cents;
end;

class operator TMoney.Implicit(a: Integer): TMoney;
begin
  Result.Cents := a * 100;  // whole dollars
end;

function TMoney.ToString: string;
begin
  Result := Format('$%d.%.2d', [Cents div 100, Cents mod 100]);
end;

var
  price, tax, total: TMoney;
begin
  price := 12;
  tax.Cents := 96;
  total := price + tax;
  WriteLn('price: ', price.ToString);
  WriteLn('total: ', total.ToString);
  WriteLn('x3:    ', (total * 3).ToString);
  WriteLn('diff:  ', (total - price).ToString);
  WriteLn('price < total: ', price < total);
  WriteLn('equal: ', price = price);
end.
