program LfuCacheDemo;

const
  Capacity = 2;
  MaxKeys = 16;

var
  keys: array[0..MaxKeys - 1] of Integer;
  values: array[0..MaxKeys - 1] of Integer;
  freqs: array[0..MaxKeys - 1] of Integer;
  count: Integer;

function FindIndex(key: Integer): Integer;
var
  i: Integer;
begin
  FindIndex := -1;
  for i := 0 to count - 1 do
    if keys[i] = key then
    begin
      FindIndex := i;
      Exit;
    end;
end;

procedure Evict;
var
  i, minIdx: Integer;
begin
  minIdx := 0;
  for i := 1 to count - 1 do
    if freqs[i] < freqs[minIdx] then minIdx := i;
  for i := minIdx to count - 2 do
  begin
    keys[i] := keys[i + 1];
    values[i] := values[i + 1];
    freqs[i] := freqs[i + 1];
  end;
  count := count - 1;
end;

procedure Put(key, value: Integer);
var
  idx: Integer;
begin
  idx := FindIndex(key);
  if idx >= 0 then
  begin
    values[idx] := value;
    freqs[idx] := freqs[idx] + 1;
    Exit;
  end;
  if count >= Capacity then Evict;
  keys[count] := key;
  values[count] := value;
  freqs[count] := 1;
  count := count + 1;
end;

function Get(key: Integer): Integer;
var
  idx: Integer;
begin
  idx := FindIndex(key);
  if idx < 0 then
  begin
    Get := -1;
    Exit;
  end;
  freqs[idx] := freqs[idx] + 1;
  Get := values[idx];
end;

begin
  count := 0;
  Put(1, 10);
  Put(2, 20);
  Get(1);
  Put(3, 30);
  WriteLn(Get(2));
  WriteLn(Get(1));
  WriteLn(Get(3));
end.
