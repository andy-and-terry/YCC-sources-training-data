type
  BloomFilter = object
    bits: seq[bool]
    size: int

proc newBloomFilter(size: int): BloomFilter =
  BloomFilter(bits: newSeq[bool](size), size: size)

proc hash1(s: string, size: int): int =
  var h = 0
  for c in s:
    h = (h * 31 + ord(c)) mod size
  result = h

proc hash2(s: string, size: int): int =
  var h = 0
  for c in s:
    h = (h * 17 + ord(c) + 7) mod size
  result = h

proc add(bf: var BloomFilter, s: string) =
  bf.bits[hash1(s, bf.size)] = true
  bf.bits[hash2(s, bf.size)] = true

proc mightContain(bf: BloomFilter, s: string): bool =
  bf.bits[hash1(s, bf.size)] and bf.bits[hash2(s, bf.size)]

var bf = newBloomFilter(64)
bf.add("apple")
bf.add("banana")
echo bf.mightContain("apple")
echo bf.mightContain("banana")
echo bf.mightContain("cherry")
