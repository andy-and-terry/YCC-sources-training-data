program SqrtDecomposition;
const BS = 4; A: array[0..11] of integer = (5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5);
var blk: array[0..2] of integer; i, s, l, r: integer;
begin
  for i := 0 to 11 do blk[i div BS] := blk[i div BS] + A[i];
  l := 2; r := 9; s := 0; i := l;
  while i <= r do
    if (i mod BS = 0) and (i + BS - 1 <= r) then begin s := s + blk[i div BS]; i := i + BS; end
    else begin s := s + A[i]; Inc(i); end;
  WriteLn(s);
end.
