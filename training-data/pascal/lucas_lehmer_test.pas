program LucasLehmerTestDemo;

function IsPrime(n: Integer): Boolean;
var
  d: Integer;
begin
  IsPrime := n >= 2;
  d := 2;
  while d * d <= n do
  begin
    if n mod d = 0 then
      IsPrime := False;
    Inc(d);
  end;
end;

function IsMersenneExponent(p: Integer): Boolean;
var
  m, s: Int64;
  i: Integer;
begin
  if p = 2 then
  begin
    IsMersenneExponent := True;
    Exit;
  end;
  m := (Int64(1) shl p) - 1;
  s := 4;
  for i := 1 to p - 2 do
    s := (s * s - 2 + m) mod m;
  IsMersenneExponent := (s = 0);
end;

var
  p: Integer;
  first: Boolean;
begin
  first := True;
  for p := 2 to 19 do
    if IsPrime(p) and IsMersenneExponent(p) then
    begin
      if not first then
        Write(' ');
      Write(p);
      first := False;
    end;
  WriteLn;
end.
