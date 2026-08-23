program SetTypeDemo;

type
  CharSet = set of Char;

var
  vowels: CharSet;
  c: Char;
  s: string;
begin
  vowels := ['a', 'e', 'i', 'o', 'u'];
  s := 'hello world';
  for c in s do
    if c in vowels then Write(c);
  WriteLn;
end.
