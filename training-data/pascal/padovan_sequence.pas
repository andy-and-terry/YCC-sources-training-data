program PadovanSequence;
{ Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1 }
var
  p: array[0..14] of LongInt;
  i: Integer;
begin
  for i := 0 to 14 do
  begin
    if i < 3 then
      p[i] := 1
    else
      p[i] := p[i - 2] + p[i - 3];
    Write(p[i], ' ');
  end;
  WriteLn;
end.
