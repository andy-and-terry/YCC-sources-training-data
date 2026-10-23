program SetOfChar;
const Vowels: set of Char = ['a', 'e', 'i', 'o', 'u'];
var
  s: string;
  c: Char;
  n: Integer;
begin
  s := 'programming in pascal';
  n := 0;
  for c in s do
    if c in Vowels then Inc(n);
  WriteLn('vowels: ', n);
end.
