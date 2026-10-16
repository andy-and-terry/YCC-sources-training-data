type
  Op = proc (a, b: int): int
  Handler = proc (msg: string) {.closure.}

proc apply(op: Op, a, b: int): int = op(a, b)

let ops = {"add": (proc (a, b: int): int = a + b),
           "mul": (proc (a, b: int): int = a * b)}
for (name, f) in ops:
  echo name, " ", apply(f, 6, 7)

var log: seq[string]
let h: Handler = proc (m: string) = log.add m
h("one"); h("two")
echo log
