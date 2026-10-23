program MoveFillCharDemo;

type
  TBytes8 = array[0..7] of Byte;

var
  src, dst: TBytes8;
  i: Integer;

procedure Dump(const label_: string; const b: TBytes8);
var
  k: Integer;
begin
  Write(label_, ':');
  for k := 0 to 7 do
    Write(' ', b[k]);
  WriteLn;
end;

begin
  // FillChar sets every byte of a memory block to one value.
  FillChar(dst, SizeOf(dst), 0);
  Dump('zeroed', dst);
  FillChar(dst, 4, 255);
  Dump('half 255', dst);

  for i := 0 to 7 do
    src[i] := i * 10;

  // Move copies a number of bytes; overlapping ranges are handled safely.
  Move(src, dst, SizeOf(src));
  Dump('copied', dst);

  Move(dst[0], dst[2], 5 * SizeOf(Byte));
  Dump('shifted', dst);
end.
