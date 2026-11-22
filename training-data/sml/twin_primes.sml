(* Twin primes: pairs (p, p+2) both prime; print the lesser of each pair. *)
fun isPrime n =
  n >= 2 andalso
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in go 2 end

val out = List.filter (fn p => isPrime p andalso isPrime (p + 2)) (List.tabulate (98, fn i => i + 2))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
