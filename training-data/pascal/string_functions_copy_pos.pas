program StrFn;
var s: string;
begin
  s := 'hello world';
  writeln(copy(s, 1, 5), ' ', pos('world', s), ' ', length(s), ' ', upcase(s[1]));
  delete(s, 1, 6); insert('big ', s, 1); writeln(s);
end.
