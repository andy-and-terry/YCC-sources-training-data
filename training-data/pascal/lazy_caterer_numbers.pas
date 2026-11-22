program LazyCatererNumbers;
{ Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1. }
var
  n: Integer;
begin
  for n := 0 to 9 do
    Write(n * (n + 1) div 2 + 1, ' ');
  WriteLn;
end.
