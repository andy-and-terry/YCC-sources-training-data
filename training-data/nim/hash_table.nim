type HashTable = object
  buckets: array[8, seq[(string, int)]]

proc hashKey(key: string): int =
  var h = 0
  for c in key:
    h = (h * 31 + ord(c)) mod 8
  result = h

proc put(t: var HashTable, key: string, value: int) =
  let idx = hashKey(key)
  for i, pair in t.buckets[idx]:
    if pair[0] == key:
      t.buckets[idx][i] = (key, value)
      return
  t.buckets[idx].add((key, value))

proc get(t: HashTable, key: string): int =
  let idx = hashKey(key)
  for pair in t.buckets[idx]:
    if pair[0] == key:
      return pair[1]
  result = -1

var t: HashTable
t.put("apple", 1)
t.put("banana", 2)
t.put("cherry", 3)
t.put("apple", 10)
echo t.get("apple")
echo t.get("banana")
echo t.get("durian")
