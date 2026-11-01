(* Sum of prime factors counted with multiplicity. *)
fun sopfr n =
  let
    fun go (1, _, acc) = acc
      | go (n, p, acc) =
          if p * p > n then acc + n
          else if n mod p = 0 then go (n div p, p, acc + p)
          else go (n, p + 1, acc)
  in
    go (n, 2, 0)
  end

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val out = List.filter (fn n => sopfr n = sopfr (n + 1)) (range (2, 109))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
