program StringToNumberConversion;

var
  n, code: Integer;
  x: Real;
  s: string;
begin
  s := '123';
  Val(s, n, code);
  WriteLn('value ', n, ' code ', code);

  s := '12a';
  Val(s, n, code);
  WriteLn('bad parse reported at position ', code);

  Val('3.75', x, code);
  WriteLn('real: ', x:0:2);

  Str(42, s);
  WriteLn('int to string: "', s, '"');
  Str(3.14159:0:3, s);
  WriteLn('real to string: "', s, '"');
  WriteLn(Chr(Ord('A') + 2), ' ', Ord('0'));
end.
