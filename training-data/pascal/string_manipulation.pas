program StringManipulationDemo;

var
  s: string;
begin
  s := 'Hello, Pascal World!';
  WriteLn(UpperCase(s));
  WriteLn(LowerCase(s));
  WriteLn(Length(s));
  WriteLn(Pos('Pascal', s));
  WriteLn(Copy(s, 1, 5));
end.
