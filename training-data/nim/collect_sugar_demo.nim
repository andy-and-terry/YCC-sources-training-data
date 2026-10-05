import sugar, tables, sets

let squares = collect(newSeq):
  for i in 1..5: i * i
echo squares

let evens = collect(initHashSet):
  for i in 1..10:
    if i mod 2 == 0: {i}
echo evens

let lens = collect(initTable):
  for w in ["a", "bb", "ccc"]: {w: w.len}
echo lens

let add = (a, b: int) => a + b
echo add(2, 3)
