program VowelCounter;

const
  Text = 'Education is beautiful';
  Vowels = 'aeiou';

var
  I, J, N: Integer;

begin
  for J := 1 to Length(Vowels) do
  begin
    N := 0;
    for I := 1 to Length(Text) do
      if LowerCase(Text[I]) = Vowels[J] then Inc(N);
    Write(Vowels[J], '=', N, ' ');
  end;
  WriteLn;
end.
