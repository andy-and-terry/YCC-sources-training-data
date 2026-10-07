(* Once declared with `infix`, a new binary operator can be defined
   with ordinary `fun` syntax, written between its two arguments. *)

infix 6 <+>
fun x <+> y = x + y * 2

val result = 3 <+> 4
val () = print (Int.toString result ^ "\n")

(* A left-to-right function composition operator, handy for building
   small pipelines out of one-argument functions. *)
infix 4 >=>
fun f >=> g = fn x => g (f x)

val pipeline = (fn x => x + 1) >=> (fn x => x * 2)
val () = print (Int.toString (pipeline 5) ^ "\n")
