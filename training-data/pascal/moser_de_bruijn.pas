program MoserDeBruijn;

{ Read the binary digits of i as base-4 digits. }
function Moser(i: LongInt): LongInt;
var power: LongInt;
begin
  Moser := 0;
  power := 1;
  while i > 0 do
  begin
    if i and 1 = 1 then Moser := Moser + power;
    power := power * 4;
    i := i shr 1;
  end;
end;

var i: Integer;
begin
  for i := 0 to 9 do Write(Moser(i), ' ');
  WriteLn; { 0 1 4 5 16 17 20 21 64 65 }
end.
