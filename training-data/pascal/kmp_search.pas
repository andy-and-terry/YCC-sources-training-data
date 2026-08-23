program KmpSearchDemo;

function BuildLps(pattern: string): array of Integer;
var
  n, len, i: Integer;
  lps: array of Integer;
begin
  n := Length(pattern);
  SetLength(lps, n + 1);
  lps[1] := 0;
  len := 0;
  i := 2;
  while i <= n do
  begin
    if pattern[i] = pattern[len + 1] then
    begin
      len := len + 1;
      lps[i] := len;
      i := i + 1;
    end
    else if len <> 0 then
      len := lps[len]
    else
    begin
      lps[i] := 0;
      i := i + 1;
    end;
  end;
  BuildLps := lps;
end;

function KmpSearch(text, pattern: string): Integer;
var
  lps: array of Integer;
  n, m, i, j: Integer;
begin
  lps := BuildLps(pattern);
  n := Length(text);
  m := Length(pattern);
  i := 1; j := 1;
  KmpSearch := -1;
  while i <= n do
  begin
    if text[i] = pattern[j] then
    begin
      i := i + 1; j := j + 1;
      if j > m then begin KmpSearch := i - j; Exit; end;
    end
    else if j > 1 then
      j := lps[j - 1] + 1
    else
      i := i + 1;
  end;
end;

begin
  WriteLn(KmpSearch('abxabcabcaby', 'abcaby'));
end.
