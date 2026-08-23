program PalindromeCheckDemo;

function IsPalindrome(s: string): Boolean;
var
  normalized: string;
  i: Integer;
  c: Char;
begin
  normalized := '';
  for i := 1 to Length(s) do
  begin
    c := LowerCase(s[i]);
    if (c >= 'a') and (c <= 'z') or (c >= '0') and (c <= '9') then
      normalized := normalized + c;
  end;
  IsPalindrome := True;
  for i := 1 to Length(normalized) div 2 do
    if normalized[i] <> normalized[Length(normalized) - i + 1] then
    begin
      IsPalindrome := False;
      Exit;
    end;
end;

begin
  WriteLn(IsPalindrome('racecar'));
  WriteLn(IsPalindrome('hello'));
end.
