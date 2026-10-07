program CaseCharClassify;

function Classify(c: Char): string;
begin
  case c of
    'a'..'z', 'A'..'Z': Classify := 'letter';
    '0'..'9': Classify := 'digit';
    ' ': Classify := 'space';
    '.', ',', ';', '!', '?': Classify := 'punctuation';
  else
    Classify := 'other';
  end;
end;

var
  s: string;
  i: Integer;
begin
  s := 'Hi 5, ok? #';
  for i := 1 to Length(s) do
    WriteLn('''', s[i], ''' is ', Classify(s[i]));
end.
