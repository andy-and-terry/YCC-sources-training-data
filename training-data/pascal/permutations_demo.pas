program PermutationsDemo;

const
  N = 3;

var
  items: array[1..N] of Char = ('A', 'B', 'C');
  count: Integer = 0;

procedure Swap(i, j: Integer);
var
  t: Char;
begin
  t := items[i];
  items[i] := items[j];
  items[j] := t;
end;

procedure Permute(k: Integer);
var
  i: Integer;
begin
  if k = N then
  begin
    Inc(count);
    for i := 1 to N do Write(items[i]);
    Write(' ');
  end
  else
    for i := k to N do
    begin
      Swap(k, i);
      Permute(k + 1);
      Swap(k, i);
    end;
end;

begin
  Permute(1);
  WriteLn;
  WriteLn('total: ', count);
end.
