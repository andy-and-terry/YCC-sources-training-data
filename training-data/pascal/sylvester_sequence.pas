program SylvesterSequence;
{ Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1 }
{ Int64 holds s(0)..s(6); stop updating before s(7) overflows. }
var
  s: Int64;
  i: Integer;
begin
  s := 2;
  for i := 0 to 6 do
  begin
    WriteLn('s(', i, ') = ', s);
    if i < 6 then
      s := s * s - s + 1;
  end;
end.
