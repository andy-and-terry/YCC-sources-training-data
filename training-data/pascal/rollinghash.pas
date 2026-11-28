program RollingHash;
const K = 3; B = 31; M = 1000003;
var s: string; i, j: integer; h: longint;
begin
  s := 'abcabc';
  for i := 1 to Length(s) - K + 1 do
  begin
    h := 0;
    for j := i to i + K - 1 do
      h := (h * B + Ord(s[j])) mod M;
    WriteLn(i - 1, ' ', h);
  end;
end.
