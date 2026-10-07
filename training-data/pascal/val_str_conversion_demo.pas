program ValStrConversionDemo;

var
  s: string;
  n, code: Integer;
  r: Real;
begin
  Val('1234', n, code);
  WriteLn('n = ', n, ', code = ', code);

  Val('12x4', n, code);
  WriteLn('error position: ', code);

  Val('3.75', r, code);
  WriteLn('r = ', r:0:2);

  Str(42:6, s);
  WriteLn('[', s, ']');
  Str(2.5:0:3, s);
  WriteLn('[', s, ']');
end.
