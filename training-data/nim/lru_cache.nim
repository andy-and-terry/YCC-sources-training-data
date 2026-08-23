import tables, sequtils

type LRUCache = object
  capacity: int
  map: Table[int, int]
  order: seq[int]

proc newLRUCache(capacity: int): LRUCache =
  LRUCache(capacity: capacity, map: initTable[int, int](), order: @[])

proc get(cache: var LRUCache, key: int): int =
  if cache.map.hasKey(key):
    cache.order = cache.order.filterIt(it != key)
    cache.order.add(key)
    return cache.map[key]
  result = -1

proc put(cache: var LRUCache, key, value: int) =
  if cache.map.hasKey(key):
    cache.order = cache.order.filterIt(it != key)
  cache.map[key] = value
  cache.order.add(key)
  if cache.order.len > cache.capacity:
    let evict = cache.order[0]
    cache.order.delete(0)
    cache.map.del(evict)

var cache = newLRUCache(2)
cache.put(1, 1)
cache.put(2, 2)
echo cache.get(1)
cache.put(3, 3)
echo cache.get(2)
