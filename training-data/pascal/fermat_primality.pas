{ Fermat primality test; Carmichael number 561 fools it. }
program FermatPrimality;
const
  Tests: array[1..3] of Int64 = (97, 91, 561);
var
  i: Integer;

function PowMod(b, e, m: Int64): Int64;
var
  r: Int64;
begin
  r := 1;
  b := b mod m;
  while e > 0 do
  begin
    if Odd(e) then r := r * b mod m;
    b := b * b mod m;
    e := e shr 1;
  end;
  PowMod := r;
end;

function ProbablyPrime(n: Int64): Boolean;
begin
  ProbablyPrime := (n > 2) and (PowMod(2, n - 1, n) = 1);
end;

begin
  for i := 1 to 3 do
    WriteLn(Tests[i], ' ', ProbablyPrime(Tests[i]));
end.
