program Sets;
type CharSet = set of Char;
var vowels, found: CharSet; c: Char;
begin
  vowels := ['a', 'e', 'i', 'o', 'u'];
  found := [];
  for c in 'programming' do
    if c in vowels then Include(found, c);
  for c in found do write(c, ' ');
  writeln;
end.
