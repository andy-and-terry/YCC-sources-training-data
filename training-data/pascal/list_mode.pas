program ListMode;

const
  Items: array[0..5] of Integer = (1, 2, 2, 3, 3, 4);

var
  Counts: array[0..9] of Integer;
  I, Top: Integer;

begin
  FillChar(Counts, SizeOf(Counts), 0);
  Top := 0;
  for I := 0 to High(Items) do
  begin
    Inc(Counts[Items[I]]);
    if Counts[Items[I]] > Top then Top := Counts[Items[I]];
  end;
  for I := 0 to 9 do
    if Counts[I] = Top then Write(I, ' ');
  WriteLn;
end.
