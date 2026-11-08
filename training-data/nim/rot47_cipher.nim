proc rot47(s: string): string =
  for c in s:
    let n = ord(c)
    if n >= 33 and n <= 126:
      result.add chr(33 + (n - 33 + 47) mod 94)
    else:
      result.add c

let e = rot47("Hello, World!")
echo e
echo rot47(e)
