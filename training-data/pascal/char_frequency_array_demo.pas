program CharFrequencyArray;

var
  counts: array['a'..'z'] of Integer;
  c: Char;
  s: string;
  i: Integer;
begin
  for c := 'a' to 'z' do
    counts[c] := 0;

  s := 'the quick brown fox jumps over the lazy dog';
  for i := 1 to Length(s) do
    if s[i] in ['a'..'z'] then
      Inc(counts[s[i]]);

  for c := 'a' to 'z' do
    if counts[c] > 1 then
      WriteLn(c, ': ', counts[c]);
end.
