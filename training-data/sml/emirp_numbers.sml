(* Emirps: primes whose digit reversal is a different prime. *)
fun isPrime n =
  n >= 2 andalso
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in go 2 end

fun reverseNum n =
  let fun go (0, r) = r
        | go (m, r) = go (m div 10, r * 10 + m mod 10)
  in go (n, 0) end

val out = List.filter
  (fn n => let val r = reverseNum n in r <> n andalso isPrime n andalso isPrime r end)
  (List.tabulate (198, fn i => i + 2))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
