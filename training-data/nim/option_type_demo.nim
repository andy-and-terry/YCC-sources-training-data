import std/options

proc findIndex(xs: seq[int], target: int): Option[int] =
  for i, x in xs:
    if x == target:
      return some(i)
  none(int)

let r1 = findIndex(@[5, 6, 7], 6)
let r2 = findIndex(@[5, 6, 7], 9)

echo r1.isSome, " ", r1.get
echo r2.isNone
echo r2.get(-1)
