program Crc8Demo;
function Crc8(const s: string): byte;
var i, j: integer; crc: byte;
begin
  crc := 0;
  for i := 1 to Length(s) do
  begin
    crc := crc xor Ord(s[i]);
    for j := 1 to 8 do
      if (crc and $80) <> 0 then crc := byte((crc shl 1) xor $07)
      else crc := byte(crc shl 1);
  end;
  Crc8 := crc;
end;
begin
  writeln(HexStr(Crc8('123456789'), 2));
end.
