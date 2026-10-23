{$mode objfpc}
program RoundTruncCeilFloorDemo;

uses Math;

procedure Show(x: Double);
begin
  WriteLn(x:7:2, '  trunc=', Trunc(x):3, '  round=', Round(x):3,
          '  ceil=', Ceil(x):3, '  floor=', Floor(x):3);
end;

begin
  Show(2.4);
  Show(2.5);   // Round uses banker's rounding: ties go to the even number
  Show(3.5);
  Show(-2.5);
  Show(-2.4);

  // Frac and Int split a value into its fractional and integer parts.
  WriteLn('Int(7.85)  = ', Int(7.85):0:2);
  WriteLn('Frac(7.85) = ', Frac(7.85):0:2);

  // Rounding to a number of decimals
  WriteLn(RoundTo(3.14159, -2):0:2);
  WriteLn('div: ', 17 div 5, ' mod: ', 17 mod 5);
  WriteLn('negative div: ', -17 div 5, ' mod: ', -17 mod 5);
end.
