(* Perfect totient numbers: sum of the iterated totient chain down to 1 equals n. *)
fun gcd (a, 0) = a
  | gcd (a, b) = gcd (b, a mod b)

fun phi n =
  let fun go (k, c) = if k > n then c else go (k + 1, if gcd (k, n) = 1 then c + 1 else c)
  in go (1, 0) end

fun chainSum m = if m <= 1 then 0 else phi m + chainSum (phi m)

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val out = List.filter (fn n => chainSum n = n) (range (2, 199))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
