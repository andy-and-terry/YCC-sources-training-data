(* Twin primes below 100; expect 8. *)
fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n > 1 andalso go 2 end
fun count lo hi pred = if lo > hi then 0 else (if pred lo then 1 else 0) + count (lo + 1) hi pred

val _ = print (Int.toString (count 2 99 (fn p => isPrime p andalso isPrime (p + 2))) ^ "\n")
