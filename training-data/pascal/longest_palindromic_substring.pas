program LongestPalindromicSubstringDemo;

function ExpandLength(const s: String; left, right: Integer): Integer;
begin
  while (left >= 1) and (right <= Length(s)) and (s[left] = s[right]) do
  begin
    left := left - 1;
    right := right + 1;
  end;
  ExpandLength := right - left - 1;
end;

function LongestPalindrome(const s: String): String;
var
  i, len1, len2, len, start: Integer;
  bestLen, bestStart: Integer;
begin
  bestLen := 1;
  bestStart := 1;
  for i := 1 to Length(s) do
  begin
    len1 := ExpandLength(s, i, i);
    len2 := ExpandLength(s, i, i + 1);
    if len1 > len2 then len := len1 else len := len2;
    if len > bestLen then
    begin
      bestLen := len;
      if len1 > len2 then
        start := i - ((len1 - 1) div 2)
      else
        start := i - ((len2 - 1) div 2) + 1;
      bestStart := start;
    end;
  end;
  LongestPalindrome := Copy(s, bestStart, bestLen);
end;

begin
  WriteLn(LongestPalindrome('babad'));
  WriteLn(LongestPalindrome('cbbd'));
end.
