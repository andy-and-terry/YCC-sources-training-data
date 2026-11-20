program GoldbachPair;
{ Goldbach pair. }
function IsPrime(n: Integer): Boolean;
var d: Integer;
begin
  IsPrime := n > 1;
  d := 2;
  while d * d <= n do begin
    if n mod d = 0 then begin IsPrime := False; Exit; end;
    Inc(d);
  end;
end;
var p, n: Integer;
begin
  n := 28;
  for p := 2 to n div 2 do
    if IsPrime(p) and IsPrime(n - p) then begin
      WriteLn(p, ' + ', n - p);
      Break;
    end;
end.
