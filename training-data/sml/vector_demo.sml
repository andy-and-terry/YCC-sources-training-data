(* SML's Vector is an immutable, fixed-length sequence -- unlike
   Array, it can never be mutated in place, which makes it safe to
   share freely. *)

val v = Vector.tabulate (5, fn i => i * i)

val () = print (Int.toString (Vector.length v) ^ "\n")
val () = print (Int.toString (Vector.sub (v, 3)) ^ "\n")

val doubled = Vector.map (fn x => x * 2) v
val total = Vector.foldl (fn (x, acc) => x + acc) 0 v

val () = print (Int.toString (Vector.sub (doubled, 2)) ^ "\n")
val () = print (Int.toString total ^ "\n")
