import std/sequtils
import std/strutils
import std/options

proc tryParse(s: string): Option[int] =
  try:
    some(parseInt(s.strip()))
  except ValueError:
    none(int)

for raw in ["42", " 17 ", "abc", "", "-8", "3.5"]:
  let r = tryParse(raw)
  if r.isSome:
    echo "'", raw, "' -> ", r.get
  else:
    echo "'", raw, "' is not an integer"

echo "sum: ", ["1", "x", "2", "y", "3"].mapIt(tryParse(it).get(0)).foldl(a + b)
