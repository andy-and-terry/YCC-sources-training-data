program LahNumbers;
{ Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5). }
const
  N = 5;
var
  k: Integer;

function Fact(m: Integer): Int64;
var
  i: Integer;
begin
  Fact := 1;
  for i := 2 to m do Fact := Fact * i;
end;

function Comb(m, j: Integer): Int64;
begin
  Comb := Fact(m) div (Fact(j) * Fact(m - j));
end;

begin
  for k := 1 to N do
    Write(Comb(N - 1, k - 1) * Fact(N) div Fact(k), ' ');
  WriteLn;
end.
