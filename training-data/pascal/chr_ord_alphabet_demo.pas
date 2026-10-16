program ChrOrdAlphabetDemo;

var
  c: Char;
  i: Integer;
begin
  for c := 'a' to 'z' do
    Write(c);
  WriteLn;

  for c := 'A' to 'F' do
    Write(c, '=', Ord(c), ' ');
  WriteLn;

  for i := 0 to 9 do
    Write(Chr(Ord('0') + i));
  WriteLn;

  c := 'm';
  WriteLn('upper: ', UpCase(c));
  WriteLn('next: ', Succ(c), ' prev: ', Pred(c));
  WriteLn('index in alphabet: ', Ord(c) - Ord('a') + 1);
end.
