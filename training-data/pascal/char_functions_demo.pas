program CharFunctionsDemo;

var
  c: Char;
begin
  for c := 'a' to 'e' do
    Write(UpCase(c));
  WriteLn;
  WriteLn(Ord('A'), ' ', Chr(66));
  WriteLn(Succ('x'), Pred('x'));
  WriteLn(('0' <= '7') and ('7' <= '9'));
  WriteLn(Ord('7') - Ord('0'));
end.
