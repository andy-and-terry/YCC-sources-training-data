program ConstantExpressionDemo;

const
  Width = 8;
  Height = Width div 2;
  Area = Width * Height;
  Greeting = 'Hello' + ', ' + 'Pascal';
  Ratio = 3 / 4;
  Digits = ['0'..'9'];
  Tau = 2 * Pi;

type
  TGrid = array[1..Height, 1..Width] of Char;

var
  grid: TGrid;
  r, c: Integer;
begin
  WriteLn('Area: ', Area);
  WriteLn(Greeting);
  WriteLn('Ratio: ', Ratio:0:2);
  WriteLn('Tau: ', Tau:0:4);
  WriteLn('5 is digit: ', '5' in Digits);

  for r := 1 to Height do
    for c := 1 to Width do
      grid[r, c] := Chr(Ord('a') + (r + c) mod 26);
  for r := 1 to Height do
  begin
    for c := 1 to Width do Write(grid[r, c]);
    WriteLn;
  end;
end.
