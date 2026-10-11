program SetOfCharDemo;

type
  TCharSet = set of Char;

var
  vowels, letters, seen: TCharSet;
  s: string;
  c: Char;
  consonants: Integer;
begin
  vowels := ['a', 'e', 'i', 'o', 'u'];
  letters := ['a'..'z'];
  seen := [];
  consonants := 0;
  s := 'pascal programming';

  for c in s do
  begin
    Include(seen, c);
    if (c in letters) and not (c in vowels) then
      Inc(consonants);
  end;

  WriteLn('consonants: ', consonants);
  WriteLn('has space: ', ' ' in seen);
  Exclude(seen, ' ');
  for c := 'a' to 'z' do
    if c in seen then Write(c);
  WriteLn;
end.
