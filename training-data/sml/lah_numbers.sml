(* Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5). *)
fun fact n = if n <= 1 then 1 else n * fact (n - 1)
fun comb (n, k) = fact n div (fact k * fact (n - k))

val n = 5
val out = List.tabulate (n, fn i => let val k = i + 1 in comb (n - 1, k - 1) * fact n div fact k end)
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
