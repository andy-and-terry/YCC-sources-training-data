program TriangularNumbers;

var
  N, Sum: Integer;

begin
  Sum := 0;
  for N := 1 to 10 do
  begin
    Sum := Sum + N;
    Write(Sum, ' ');
  end;
  WriteLn;
end.
