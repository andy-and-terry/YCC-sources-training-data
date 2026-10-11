program MathUnitFunctionsDemo;

uses Math;

begin
  WriteLn('Max: ', Max(3, 9), ' Min: ', Min(3, 9));
  WriteLn('Ceil(2.1): ', Ceil(2.1), ' Floor(-2.1): ', Floor(-2.1));
  WriteLn('Power(2,10): ', Power(2, 10):0:0);
  WriteLn('IntPower(3,4): ', IntPower(3, 4):0:0);
  WriteLn('Log2(1024): ', Log2(1024):0:2);
  WriteLn('Log10(1000): ', Log10(1000):0:2);
  WriteLn('Hypot(3,4): ', Hypot(3, 4):0:2);
  WriteLn('Sign(-8): ', Sign(-8));
  WriteLn('InRange(5,1,10): ', InRange(5, 1, 10));
  WriteLn('EnsureRange(15,1,10): ', EnsureRange(15, 1, 10));
  WriteLn('DegToRad(180): ', DegToRad(180):0:4);
  WriteLn('Sum: ', Sum([1.5, 2.5, 3.0]):0:1);
end.
