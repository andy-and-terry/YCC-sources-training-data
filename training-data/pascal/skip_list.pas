program SkipListDemo;

{ Simplified skip list: maintains a sorted array rather than true
  multi-level forward pointers, exposing the same search contract. }

const
  MaxItems = 16;

var
  values: array[0..MaxItems - 1] of Integer;
  count: Integer;

procedure Insert(v: Integer);
var
  i, pos: Integer;
begin
  pos := count;
  for i := 0 to count - 1 do
    if values[i] > v then
    begin
      pos := i;
      Break;
    end;
  for i := count downto pos + 1 do
    values[i] := values[i - 1];
  values[pos] := v;
  count := count + 1;
end;

function Contains(v: Integer): Boolean;
var
  lo, hi, mid: Integer;
begin
  lo := 0;
  hi := count - 1;
  Contains := False;
  while lo <= hi do
  begin
    mid := (lo + hi) div 2;
    if values[mid] = v then
    begin
      Contains := True;
      Exit;
    end
    else if values[mid] < v then
      lo := mid + 1
    else
      hi := mid - 1;
  end;
end;

begin
  count := 0;
  Insert(9); Insert(3); Insert(7); Insert(6); Insert(12); Insert(19);
  WriteLn(Contains(9));
  WriteLn(Contains(10));
end.
