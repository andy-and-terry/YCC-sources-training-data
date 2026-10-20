import sequtils, strutils
let r = toSeq(1..10).filterIt(it mod 3 == 0).mapIt(it * it)
echo r, " ", r.foldl(a + b)
echo "a b c".split().join("-")
