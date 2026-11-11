{ Integer (1..3999) to Roman numeral using a greedy table. }
program IntToRoman;
const
  Values: array[1..13] of Integer = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
  Symbols: array[1..13] of string = ('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');

function ToRoman(n: Integer): string;
var
  i: Integer;
begin
  ToRoman := '';
  for i := 1 to 13 do
    while n >= Values[i] do
    begin
      ToRoman := ToRoman + Symbols[i];
      n := n - Values[i];
    end;
end;

begin
  WriteLn(ToRoman(1994), ' ', ToRoman(58));
end.
