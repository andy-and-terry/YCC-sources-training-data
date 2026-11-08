fun encode [] = []
  | encode (x :: xs) =
      x :: ListPair.map (fn (a, b) => b - a) (x :: xs, xs)

fun decode ds =
  rev (#2 (foldl (fn (d, (acc, out)) => (acc + d, (acc + d) :: out)) (0, []) ds))

val d = encode [10, 12, 15, 15, 20]
val () = print (String.concatWith " " (map Int.toString d) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (decode d)) ^ "\n")
