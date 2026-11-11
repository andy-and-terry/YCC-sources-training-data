(* Highest value reached by the Collatz (hailstone) sequence from n. *)
fun peak n =
  let
    fun go 1 best = best
      | go m best =
          let val next = if m mod 2 = 0 then m div 2 else 3 * m + 1
          in go next (Int.max (best, next)) end
  in go n n end

val () = print (Int.toString (peak 27) ^ "\n")
