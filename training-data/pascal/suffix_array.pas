program SuffixArrayDemo;

const
  MaxLen = 32;

var
  text: String;
  n, i, j: Integer;
  indices: array[0..MaxLen - 1] of Integer;
  temp: Integer;

begin
  text := 'banana';
  n := Length(text);
  for i := 0 to n - 1 do indices[i] := i;

  for i := 0 to n - 2 do
    for j := 0 to n - 2 - i do
      if Copy(text, indices[j] + 1, n) > Copy(text, indices[j + 1] + 1, n) then
      begin
        temp := indices[j];
        indices[j] := indices[j + 1];
        indices[j + 1] := temp;
      end;

  for i := 0 to n - 1 do
    WriteLn(indices[i], ': ', Copy(text, indices[i] + 1, n));
end.
