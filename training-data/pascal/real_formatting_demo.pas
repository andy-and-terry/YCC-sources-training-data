program RealFormattingDemo;

var
  x: Double;
begin
  x := 1234.56789;
  WriteLn(x);
  WriteLn(x:0:2);
  WriteLn(x:12:1);
  WriteLn(x:0:0);
  WriteLn(-0.000123:0:6);
  WriteLn(1.0e10);
  WriteLn(Pi:0:10);
  WriteLn(Sqrt(2):0:6);
  WriteLn(Exp(1):0:6);
  WriteLn(Ln(10):0:6);
  WriteLn(Frac(3.75):0:2, ' ', Int(3.75):0:0);
end.
