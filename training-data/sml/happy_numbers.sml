fun digitSquareSum 0 = 0
  | digitSquareSum n = (n mod 10) * (n mod 10) + digitSquareSum (n div 10)

fun isHappy n =
  let
    fun go (1, _) = true
      | go (m, seen) =
          if List.exists (fn x => x = m) seen then false
          else go (digitSquareSum m, m :: seen)
  in go (n, []) end

val happy = List.filter isHappy (List.tabulate (40, fn i => i + 1))
val _ = print (String.concatWith " " (map Int.toString happy) ^ "\n")
(* 1 7 10 13 19 23 28 31 32 44 *)
