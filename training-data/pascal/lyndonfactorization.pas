program LyndonFactorization;
var s: string; n, i, j, k: integer;
begin
  s := 'banana'; n := Length(s); i := 1;
  while i <= n do
  begin
    j := i + 1; k := i;
    while (j <= n) and (s[k] <= s[j]) do
    begin
      if s[k] < s[j] then k := i else Inc(k);
      Inc(j);
    end;
    while i <= k do
    begin
      WriteLn(Copy(s, i, j - k));
      i := i + (j - k);
    end;
  end;
end.
