import tables

type
  LfuCache = object
    capacity: int
    values: Table[int, int]
    freqs: Table[int, int]

proc newLfuCache(capacity: int): LfuCache =
  LfuCache(capacity: capacity, values: initTable[int, int](), freqs: initTable[int, int]())

proc evict(cache: var LfuCache) =
  var minKey = -1
  var minFreq = high(int)
  for k, f in cache.freqs:
    if f < minFreq:
      minFreq = f
      minKey = k
  cache.values.del(minKey)
  cache.freqs.del(minKey)

proc put(cache: var LfuCache, key, value: int) =
  if cache.capacity <= 0:
    return
  if cache.values.hasKey(key):
    cache.values[key] = value
    cache.freqs[key] += 1
    return
  if cache.values.len >= cache.capacity:
    cache.evict()
  cache.values[key] = value
  cache.freqs[key] = 1

proc get(cache: var LfuCache, key: int): int =
  if not cache.values.hasKey(key):
    return -1
  cache.freqs[key] += 1
  result = cache.values[key]

var cache = newLfuCache(2)
cache.put(1, 10)
cache.put(2, 20)
discard cache.get(1)
cache.put(3, 30)
echo cache.get(2)
echo cache.get(1)
echo cache.get(3)
