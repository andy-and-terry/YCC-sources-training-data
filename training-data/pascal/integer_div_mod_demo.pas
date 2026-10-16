program IntegerDivModDemo;

var
  a, b: Integer;
begin
  a := 17;
  b := 5;
  WriteLn(a, ' div ', b, ' = ', a div b);
  WriteLn(a, ' mod ', b, ' = ', a mod b);
  WriteLn(-a, ' div ', b, ' = ', -a div b);
  WriteLn(-a, ' mod ', b, ' = ', -a mod b);
  WriteLn(a, ' / ', b, ' = ', a / b:0:3);
  WriteLn('Trunc(2.9)=', Trunc(2.9), ' Round(2.5)=', Round(2.5), ' Round(3.5)=', Round(3.5));
  WriteLn('Abs(-4)=', Abs(-4), ' Sqr(7)=', Sqr(7));
  WriteLn('Odd(7)=', Odd(7), ' Odd(8)=', Odd(8));
end.
