program SieveDemo;

const
  Limit = 50;

var
  isComposite: array[2..Limit] of Boolean;
  i, j: Integer;
begin
  for i := 2 to Limit do isComposite[i] := False;
  i := 2;
  while i * i <= Limit do
  begin
    if not isComposite[i] then
    begin
      j := i * i;
      while j <= Limit do
      begin
        isComposite[j] := True;
        j := j + i;
      end;
    end;
    i := i + 1;
  end;
  for i := 2 to Limit do
    if not isComposite[i] then Write(i, ' ');
  WriteLn;
end.
