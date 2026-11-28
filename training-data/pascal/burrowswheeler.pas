program BurrowsWheeler;
const N = 7;
var s: string; rots: array[1..N] of string; i, j: integer; tmp: string;
begin
  s := 'banana$';
  for i := 1 to N do rots[i] := Copy(s, i, N) + Copy(s, 1, i - 1);
  for i := 2 to N do
  begin
    tmp := rots[i]; j := i - 1;
    while (j >= 1) and (rots[j] > tmp) do begin rots[j + 1] := rots[j]; Dec(j); end;
    rots[j + 1] := tmp;
  end;
  for i := 1 to N do Write(rots[i][N]);
  WriteLn;
end.
