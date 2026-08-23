program BinaryToDecimalDemo;

function BinaryToDecimal(s: string): Integer;
var
  result, i: Integer;
begin
  result := 0;
  for i := 1 to Length(s) do
    result := result * 2 + (Ord(s[i]) - Ord('0'));
  BinaryToDecimal := result;
end;

begin
  WriteLn(BinaryToDecimal('1011'));
end.
