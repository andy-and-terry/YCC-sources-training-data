proc makeCounter(start: int): proc (): int =
  var count = start
  result = proc (): int =
    count += 1
    count

proc makeMultiplier(factor: int): proc (x: int): int =
  result = proc (x: int): int = x * factor

let counter = makeCounter(10)
echo counter()
echo counter()
echo counter()

let triple = makeMultiplier(3)
echo triple(7)

# each call to makeCounter/makeMultiplier captures its own environment,
# so independently created closures never share state.
let counter2 = makeCounter(100)
echo counter2()
echo counter()
