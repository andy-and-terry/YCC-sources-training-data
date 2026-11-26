(* Circular primes below 100; expect 13. *)
fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n > 1 andalso go 2 end
fun count lo hi pred = if lo > hi then 0 else (if pred lo then 1 else 0) + count (lo + 1) hi pred

fun circular n =
  let
    val s = Int.toString n
    val len = String.size s
    fun rot i = valOf (Int.fromString (String.extract (s, i, NONE) ^ String.substring (s, 0, i)))
    fun go i = i >= len orelse (isPrime (rot i) andalso go (i + 1))
  in go 0 end
val _ = print (Int.toString (count 2 99 circular) ^ "\n")
