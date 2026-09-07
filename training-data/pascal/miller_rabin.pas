program MillerRabinDemo;

function PowerMod(base, exp, modulus: Int64): Int64;
var
  result_: Int64;
begin
  result_ := 1;
  base := base mod modulus;
  while exp > 0 do
  begin
    if exp mod 2 = 1 then
      result_ := (result_ * base) mod modulus;
    exp := exp div 2;
    base := (base * base) mod modulus;
  end;
  PowerMod := result_;
end;

function MillerTest(d, n: Int64; a: Int64): Boolean;
var
  x: Int64;
begin
  x := PowerMod(a, d, n);
  if (x = 1) or (x = n - 1) then
  begin
    MillerTest := True;
    Exit;
  end;
  while d <> n - 1 do
  begin
    x := (x * x) mod n;
    d := d * 2;
    if x = 1 then
    begin
      MillerTest := False;
      Exit;
    end;
    if x = n - 1 then
    begin
      MillerTest := True;
      Exit;
    end;
  end;
  MillerTest := False;
end;

function IsPrime(n: Int64): Boolean;
var
  d: Int64;
  i: Integer;
  witnesses: array[0..3] of Int64;
begin
  if (n <= 1) then begin IsPrime := False; Exit; end;
  if (n <= 3) then begin IsPrime := True; Exit; end;
  if (n mod 2 = 0) then begin IsPrime := False; Exit; end;
  d := n - 1;
  while d mod 2 = 0 do d := d div 2;
  witnesses[0] := 2;
  witnesses[1] := 3;
  witnesses[2] := 5;
  witnesses[3] := 7;
  for i := 0 to 3 do
    if witnesses[i] < n then
      if not MillerTest(d, n, witnesses[i]) then
      begin
        IsPrime := False;
        Exit;
      end;
  IsPrime := True;
end;

var
  n: Integer;
begin
  for n := 2 to 50 do
    if IsPrime(n) then
      Write(n, ' ');
  WriteLn;
  WriteLn(IsPrime(97));
  WriteLn(IsPrime(561));
end.
