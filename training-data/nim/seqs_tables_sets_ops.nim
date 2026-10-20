import tables, sets, sequtils, algorithm, strutils

var s = @[5, 3, 8, 1]
s.add 9
s.sort()
echo s, " ", s.reversed(), " ", s.filterIt(it > 3), " ", s.mapIt(it * 2)
echo s.foldl(a + b), " ", s.anyIt(it > 8), " ", s.allIt(it > 0), " ", s.deduplicate(), " ", s.zip(s).len
var t = initTable[string, int]()
t["a"] = 1
t["b"] = 2
t.inc("a")
echo t["a"], " ", t.getOrDefault("z", -1), " ", t.hasKey("b"), " ", t.len
for k, v in t: echo k, "=", v
var hs = toHashSet([1, 2, 3])
hs.incl 9
echo hs.contains(2), " ", hs.len, " ", hs * toHashSet([2, 9, 10])
let ct = "mississippi".toCountTable()
echo ct["s"], " ", ct.largest
echo toSeq(1..5).distribute(2), " ", @[1, 2, 3, 4].toSeq.mapIt($it).join("-")
