type
  Pair[A, B] = object
    first: A
    second: B

proc pair[A, B](a: A, b: B): Pair[A, B] = Pair[A, B](first: a, second: b)
proc swap[A, B](p: Pair[A, B]): Pair[B, A] = pair(p.second, p.first)

let p = pair(1, "one")
echo p
echo swap(p)
echo p.first, " ", swap(p).first
