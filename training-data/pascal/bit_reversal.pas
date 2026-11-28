program BitReversal;

function ReverseByte(v: Byte): Byte;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to 8 do
  begin
    Result := (Result shl 1) or (v and 1);
    v := v shr 1;
  end;
end;

const
  Inputs: array[0..3] of Byte = (1, 6, 13, 128);
var
  i: Integer;
begin
  for i := 0 to 3 do
    WriteLn(Inputs[i], ' ', ReverseByte(Inputs[i])); { 128 96 176 1 }
end.
