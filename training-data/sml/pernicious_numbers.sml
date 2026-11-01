(* Pernicious numbers: the popcount is prime. *)
fun isPrime n =
  let
    fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in
    n >= 2 andalso go 2
  end

fun popcount 0 = 0
  | popcount n = (n mod 2) + popcount (n div 2)

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val out = List.filter (fn n => isPrime (popcount n)) (range (1, 20))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
