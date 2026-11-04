program UglyNumbersMerge;

function Min3(a, b, c: Int64): Int64;
begin
  Result := a;
  if b < Result then Result := b;
  if c < Result then Result := c;
end;

function Ugly(n: Integer): Int64;
var
  seq: array of Int64;
  i2, i3, i5, k: Integer;
  c2, c3, c5, next: Int64;
begin
  SetLength(seq, n);
  seq[0] := 1; i2 := 0; i3 := 0; i5 := 0;
  for k := 1 to n - 1 do
  begin
    c2 := seq[i2] * 2; c3 := seq[i3] * 3; c5 := seq[i5] * 5;
    next := Min3(c2, c3, c5);
    seq[k] := next;
    if next = c2 then Inc(i2);
    if next = c3 then Inc(i3);
    if next = c5 then Inc(i5);
  end;
  Result := seq[n - 1];
end;

var i: Integer;
begin
  for i := 1 to 12 do Write(Ugly(i), ' ');
  WriteLn;
end.
