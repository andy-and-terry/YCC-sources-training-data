import complex

proc escape(c: Complex64): int =
  var z = complex64(0.0, 0.0)
  for n in 0 ..< 30:
    if abs(z) >= 2.0: return n
    z = z * z + c
  30

for yi in -5 .. 5:
  var line = ""
  for xi in -40 .. 12:
    line.add(if escape(complex64(xi / 20, yi / 5)) == 30: '#' else: '.')
  echo line
