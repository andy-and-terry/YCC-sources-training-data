program WordBreakDemo;

const
  DictSize = 2;

var
  dict: array[0..DictSize - 1] of String = ('leet', 'code');

function InDict(const s: String): Boolean;
var
  i: Integer;
begin
  InDict := False;
  for i := 0 to DictSize - 1 do
    if dict[i] = s then
    begin
      InDict := True;
      Exit;
    end;
end;

function WordBreak(const s: String): Boolean;
var
  n, i, j: Integer;
  dp: array[0..255] of Boolean;
begin
  n := Length(s);
  dp[0] := True;
  for i := 1 to n do
  begin
    dp[i] := False;
    for j := 0 to i - 1 do
      if dp[j] and InDict(Copy(s, j + 1, i - j)) then
        dp[i] := True;
  end;
  WordBreak := dp[n];
end;

begin
  WriteLn(WordBreak('leetcode'));
  WriteLn(WordBreak('leetcodex'));
end.
