program DedupeAdjacent;
{ Remove consecutive duplicate characters. }
var s, o: string; i: Integer;
begin
  s := 'aabbbcdd'; o := '';
  for i := 1 to Length(s) do
    if (i = 1) or (s[i] <> s[i - 1]) then o := o + s[i];
  WriteLn(o);
end.
