program PalindromicPrimes;

function IsPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  Result := n >= 2;
  i := 2;
  while Result and (i * i <= n) do
  begin
    if n mod i = 0 then Result := False;
    Inc(i);
  end;
end;

function IsPalindrome(n: Integer): Boolean;
var
  m, r: Integer;
begin
  m := n;
  r := 0;
  while m > 0 do
  begin
    r := r * 10 + m mod 10;
    m := m div 10;
  end;
  Result := r = n;
end;

var
  n: Integer;
begin
  for n := 2 to 199 do
    if IsPalindrome(n) and IsPrime(n) then Write(n, ' ');
  WriteLn; { 2 3 5 7 11 101 131 151 181 191 }
end.
