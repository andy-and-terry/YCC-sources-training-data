program BooleanOperatorsDemo;

var
  a, b: Boolean;
begin
  a := True;
  b := False;
  WriteLn('a and b: ', a and b);
  WriteLn('a or b: ', a or b);
  WriteLn('a xor b: ', a xor b);
  WriteLn('not a: ', not a);
  WriteLn('Ord(True): ', Ord(True), ' Ord(False): ', Ord(False));

  WriteLn('truth table for xor:');
  for a := False to True do
    for b := False to True do
      WriteLn(a:5, b:6, (a xor b):6);

  WriteLn('short circuit: ', (b) and (1 div 1 = 1));
end.
