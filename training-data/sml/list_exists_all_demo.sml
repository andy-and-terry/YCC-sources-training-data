(* List.exists, List.all, List.find, List.filter as predicate tests. *)
val nums = [2, 4, 6, 7, 8]

val anyOdd  = List.exists (fn x => x mod 2 = 1) nums
val allEven = List.all (fn x => x mod 2 = 0) nums
val firstBig = List.find (fn x => x > 5) nums

fun b true = "true" | b false = "false"

val _ = print ("any odd: " ^ b anyOdd ^ "\n")
val _ = print ("all even: " ^ b allEven ^ "\n")
val _ = print ("first > 5: " ^ (case firstBig of SOME v => Int.toString v | NONE => "none") ^ "\n")

(* Vacuous truth on empty lists *)
val _ = print (b (List.all (fn _ => false) []) ^ " " ^ b (List.exists (fn _ => true) []) ^ "\n")

(* Build all/exists from foldl *)
fun myAll p = List.foldl (fn (x, acc) => acc andalso p x) true
val _ = print (b (myAll (fn x => x > 0) nums) ^ "\n")

(* findi-style search via position *)
fun indexOf p l =
  let fun go (_, []) = NONE
        | go (i, x :: xs) = if p x then SOME i else go (i + 1, xs)
  in go (0, l) end
val _ = print (case indexOf (fn x => x = 7) nums of SOME i => Int.toString i | NONE => "-1")
val _ = print "\n"

val (small, large) = List.partition (fn x => x < 6) nums
val _ = print (Int.toString (length small) ^ "/" ^ Int.toString (length large) ^ "\n")
