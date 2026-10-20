program CharSet;
var c: Char; vowels: set of Char; n: Integer;
begin
  vowels := ['a', 'e', 'i', 'o', 'u'];
  n := 0;
  for c in 'programming' do if c in vowels then Inc(n);
  writeln(n);
end.
