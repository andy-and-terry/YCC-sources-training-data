program HashTableDemo;

const
  BucketCount = 8;

type
  Entry = record
    key: string;
    value: Integer;
    used: Boolean;
  end;
  Bucket = array[0..9] of Entry;

var
  table: array[0..BucketCount - 1] of Bucket;
  bucketSizes: array[0..BucketCount - 1] of Integer;

function HashKey(key: string): Integer;
var
  i, h: Integer;
begin
  h := 0;
  for i := 1 to Length(key) do
    h := (h * 31 + Ord(key[i])) mod BucketCount;
  HashKey := h;
end;

procedure Put(key: string; value: Integer);
var
  idx, i: Integer;
begin
  idx := HashKey(key);
  for i := 0 to bucketSizes[idx] - 1 do
    if table[idx][i].key = key then
    begin
      table[idx][i].value := value;
      Exit;
    end;
  table[idx][bucketSizes[idx]].key := key;
  table[idx][bucketSizes[idx]].value := value;
  table[idx][bucketSizes[idx]].used := True;
  bucketSizes[idx] := bucketSizes[idx] + 1;
end;

function Get(key: string; var found: Boolean): Integer;
var
  idx, i: Integer;
begin
  idx := HashKey(key);
  for i := 0 to bucketSizes[idx] - 1 do
    if table[idx][i].key = key then
    begin
      found := True;
      Get := table[idx][i].value;
      Exit;
    end;
  found := False;
  Get := -1;
end;

var
  i: Integer;
  found: Boolean;
  result_: Integer;
begin
  for i := 0 to BucketCount - 1 do
    bucketSizes[i] := 0;
  Put('apple', 1);
  Put('banana', 2);
  Put('cherry', 3);
  Put('apple', 10);
  result_ := Get('banana', found);
  WriteLn(found, ' ', result_);
  result_ := Get('apple', found);
  WriteLn(found, ' ', result_);
  result_ := Get('durian', found);
  WriteLn(found, ' ', result_);
end.
