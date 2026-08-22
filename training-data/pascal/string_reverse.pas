program StringReverseDemo;

function ReverseString(s: String): String;
var
  i: Integer;
  result: String;
begin
  result := '';
  for i := Length(s) downto 1 do
    result := result + s[i];
  ReverseString := result;
end;

begin
  WriteLn(ReverseString('hello world'));
end.
