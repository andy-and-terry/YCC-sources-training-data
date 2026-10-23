program ZeckendorfRepresentationDemo;

var
  fib: array[1..40] of Integer;
  k, i, remaining: Integer;
  first: Boolean;
begin
  fib[1] := 1;
  fib[2] := 2;
  k := 2;
  while fib[k] + fib[k - 1] <= 100 do
  begin
    fib[k + 1] := fib[k] + fib[k - 1];
    Inc(k);
  end;

  remaining := 100;
  first := True;
  for i := k downto 1 do
    if fib[i] <= remaining then
    begin
      if not first then
        Write(' ');
      Write(fib[i]);
      first := False;
      remaining := remaining - fib[i];
    end;
  WriteLn;
end.
