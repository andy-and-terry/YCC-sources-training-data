fun pow (_, 0) = 1
  | pow (b, e) = b * pow (b, e - 1)

fun isArmstrong n =
  let
    val ds = map (fn c => ord c - ord #"0") (String.explode (Int.toString n))
    val len = length ds
  in foldl (fn (d, acc) => acc + pow (d, len)) 0 ds = n end

val result = List.filter isArmstrong (List.tabulate (999, fn i => i + 1))
val _ = print (String.concatWith " " (map Int.toString result) ^ "\n")
(* 1..9 153 370 371 407 *)
