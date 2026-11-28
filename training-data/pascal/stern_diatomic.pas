program SternDiatomic;

var
  seq: array[0..14] of Integer;
  i: Integer;
begin
  seq[0] := 0;
  seq[1] := 1;
  for i := 2 to 14 do
    if i mod 2 = 0 then
      seq[i] := seq[i div 2]
    else
      seq[i] := seq[i div 2] + seq[i div 2 + 1];
  for i := 0 to 14 do Write(seq[i], ' ');
  WriteLn; { 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 }
end.
