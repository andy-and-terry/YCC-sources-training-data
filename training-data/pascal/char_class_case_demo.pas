program CharClassCaseDemo;

function Classify(c: Char): string;
begin
  case c of
    'a'..'z': Classify := 'lower';
    'A'..'Z': Classify := 'upper';
    '0'..'9': Classify := 'digit';
    ' ', #9: Classify := 'space';
  else
    Classify := 'other';
  end;
end;

var
  s: string;
  i: Integer;
begin
  s := 'Hi 5!';
  for i := 1 to Length(s) do
    WriteLn('''', s[i], ''' -> ', Classify(s[i]));
  WriteLn(Ord('A'), ' ', Chr(97), ' ', UpCase('q'));
end.
