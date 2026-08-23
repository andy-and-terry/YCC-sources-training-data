program LruCacheDemo;

type
  LRUCache = record
    keys: array[0..1] of Integer;
    values: array[0..1] of Integer;
    count: Integer;
  end;

function Get(var cache: LRUCache; key: Integer): Integer;
var
  i, j, val: Integer;
  tempK, tempV: Integer;
begin
  for i := 0 to cache.count - 1 do
    if cache.keys[i] = key then
    begin
      val := cache.values[i];
      for j := i downto 1 do
      begin
        cache.keys[j] := cache.keys[j-1];
        cache.values[j] := cache.values[j-1];
      end;
      cache.keys[0] := key;
      cache.values[0] := val;
      Get := val;
      Exit;
    end;
  Get := -1;
end;

procedure Put(var cache: LRUCache; key, value: Integer);
var
  i: Integer;
begin
  if cache.count < 2 then
  begin
    for i := cache.count downto 1 do
    begin
      cache.keys[i] := cache.keys[i-1];
      cache.values[i] := cache.values[i-1];
    end;
    cache.keys[0] := key;
    cache.values[0] := value;
    cache.count := cache.count + 1;
  end;
end;

var
  cache: LRUCache;
begin
  cache.count := 0;
  Put(cache, 1, 10);
  Put(cache, 2, 20);
  WriteLn(Get(cache, 1));
end.
