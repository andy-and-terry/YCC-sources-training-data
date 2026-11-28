import std/[algorithm, sequtils]

proc order(n, k: int): seq[int] =
  let cycle = 2 * (k - 1)
  proc rail(i: int): int =
    let r = i mod cycle
    if r < k: r else: cycle - r
  toSeq(0 ..< n).sortedByIt((rail(it), it))

proc encrypt(t: string, k: int): string =
  for i in order(t.len, k): result.add t[i]

proc decrypt(c: string, k: int): string =
  result = newString(c.len)
  for pos, i in order(c.len, k): result[i] = c[pos]

let c = encrypt("WEAREDISCOVERED", 3)
echo c, " ", decrypt(c, 3)
