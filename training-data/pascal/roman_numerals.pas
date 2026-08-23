program RomanNumeralsDemo;

function ToRoman(n: Integer): string;
const
  values: array[0..12] of Integer = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
  symbols: array[0..12] of string = ('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');
var
  result: string;
  remaining, i: Integer;
begin
  result := '';
  remaining := n;
  for i := 0 to 12 do
    while remaining >= values[i] do
    begin
      result := result + symbols[i];
      remaining := remaining - values[i];
    end;
  ToRoman := result;
end;

begin
  WriteLn(ToRoman(1994));
end.
