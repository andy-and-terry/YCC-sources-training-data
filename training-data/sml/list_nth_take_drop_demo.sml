(* List.nth, List.take, List.drop, and safe variants. *)
val xs = [10, 20, 30, 40, 50]

val _ = print (Int.toString (List.nth (xs, 2)) ^ "\n")      (* 30 *)

fun showList l = "[" ^ String.concatWith "," (map Int.toString l) ^ "]"

val _ = print (showList (List.take (xs, 2)) ^ "\n")          (* [10,20] *)
val _ = print (showList (List.drop (xs, 2)) ^ "\n")          (* [30,40,50] *)

(* nth/take/drop raise Subscript on out-of-range indexes *)
fun safeNth (l, i) = SOME (List.nth (l, i)) handle Subscript => NONE

val _ = print (case safeNth (xs, 9) of NONE => "none\n" | SOME v => Int.toString v ^ "\n")
val _ = print (case safeNth (xs, 0) of NONE => "none\n" | SOME v => Int.toString v ^ "\n")

(* splitAt = (take, drop) in one call *)
fun splitAt (l, n) = (List.take (l, n), List.drop (l, n))
val (front, back) = splitAt (xs, 3)
val _ = print (showList front ^ " " ^ showList back ^ "\n")

val _ = print (showList (List.tabulate (5, fn i => i * i)) ^ "\n")
val _ = print (showList (List.rev xs) ^ "\n")
val _ = print (Int.toString (length xs) ^ " " ^ Int.toString (hd xs) ^ " " ^ Int.toString (List.last xs) ^ "\n")
