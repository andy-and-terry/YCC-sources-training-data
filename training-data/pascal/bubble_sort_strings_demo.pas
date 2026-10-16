program BubbleSortStringsDemo;

const
  Count = 6;

var
  names: array[1..Count] of string;
  i, j: Integer;
  tmp: string;
  swapped: Boolean;
begin
  names[1] := 'mango';  names[2] := 'apple'; names[3] := 'cherry';
  names[4] := 'banana'; names[5] := 'fig';   names[6] := 'date';

  for i := 1 to Count - 1 do
  begin
    swapped := False;
    for j := 1 to Count - i do
      if names[j] > names[j + 1] then
      begin
        tmp := names[j];
        names[j] := names[j + 1];
        names[j + 1] := tmp;
        swapped := True;
      end;
    if not swapped then Break;
  end;

  for i := 1 to Count do
    WriteLn(names[i]);
end.
