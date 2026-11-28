proc modInverse(a, m: int): int =
  for x in 1 ..< m:
    if a * x mod m == 1: return x

proc affine(s: string, a, b: int, decrypt = false): string =
  let inv = modInverse(a, 26)
  for ch in s:
    if ch in 'A' .. 'Z':
      let x = ord(ch) - 65
      let y = if decrypt: ((inv * (x - b)) mod 26 + 26) mod 26 else: (a * x + b) mod 26
      result.add chr(y + 65)
    else:
      result.add ch

let c = affine("AFFINE", 5, 8)
echo c, " ", affine(c, 5, 8, true)
