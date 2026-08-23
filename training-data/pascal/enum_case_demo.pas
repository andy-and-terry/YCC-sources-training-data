program EnumCaseDemo;

type
  Direction = (North, South, East, West);

function Describe(d: Direction): string;
begin
  case d of
    North: Describe := 'going up';
    South: Describe := 'going down';
    East: Describe := 'going right';
    West: Describe := 'going left';
  end;
end;

begin
  WriteLn(Describe(North));
  WriteLn(Describe(West));
end.
