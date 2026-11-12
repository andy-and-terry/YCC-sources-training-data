import tables, sets, sequtils
var t = initTable[string, int]()
t["a"] = 1; t["b"] = 2
echo t, toHashSet([1, 2, 2, 3]).len
echo (1..5).toSeq.mapIt(it * it)
