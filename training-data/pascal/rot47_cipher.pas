program Rot47;
function Rot(s: string): string;
var i, n: integer;
begin
  Rot := s;
  for i := 1 to Length(s) do
  begin
    n := Ord(s[i]);
    if (n >= 33) and (n <= 126) then
      Rot[i] := Chr(33 + (n - 33 + 47) mod 94);
  end;
end;
var e: string;
begin
  e := Rot('Hello, World!');
  writeln(e);
  writeln(Rot(e));
end.
