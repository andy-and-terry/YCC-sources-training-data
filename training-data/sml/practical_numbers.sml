(* Practical numbers: every m in 1..n is a sum of distinct divisors of n. *)
fun isPractical n =
  let
    (* bit i set <=> i is a subset sum of the divisors *)
    fun go (d, reach) =
      if d > n then reach
      else if n mod d = 0 then go (d + 1, Word64.orb (reach, Word64.<< (reach, Word.fromInt d)))
      else go (d + 1, reach)
    val reach = go (1, 0w1)
    val mask = Word64.- (Word64.<< (0w1, Word.fromInt (n + 1)), 0w1)
  in Word64.andb (reach, mask) = mask end

val out = List.filter isPractical (List.tabulate (40, fn i => i + 1))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
