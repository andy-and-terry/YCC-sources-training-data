import std/times

template withTimer(label: string, body: untyped) =
  let start = cpuTime()
  body
  let elapsed = cpuTime() - start
  echo label, " finished: ", elapsed >= 0.0

var total = 0
withTimer("sum"):
  for i in 1 .. 1000:
    total += i
echo total
