program DecimalToRomanTableDemo;

const
  Values: array[1..13] of Integer = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
  Symbols: array[1..13] of string = ('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');

function ToRoman(n: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to 13 do
    while n >= Values[i] do
    begin
      Result := Result + Symbols[i];
      n := n - Values[i];
    end;
end;

begin
  WriteLn(ToRoman(1994));
  WriteLn(ToRoman(2024));
  WriteLn(ToRoman(49));
end.
