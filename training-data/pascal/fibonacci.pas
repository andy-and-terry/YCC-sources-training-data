program FibonacciDemo;

var
  i, a, b, temp: Integer;
begin
  a := 0;
  b := 1;
  for i := 0 to 10 do
  begin
    Write(a, ' ');
    temp := a + b;
    a := b;
    b := temp;
  end;
  WriteLn;
end.
