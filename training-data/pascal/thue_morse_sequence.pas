program ThueMorseSequence;
{ Thue-Morse: t(n) is the parity of the number of 1 bits in n }
function Parity(n: Integer): Integer;
begin
  Parity := 0;
  while n > 0 do
  begin
    Parity := Parity xor (n and 1);
    n := n shr 1;
  end;
end;

var
  n: Integer;
begin
  for n := 0 to 31 do
    Write(Parity(n));
  WriteLn;
end.
