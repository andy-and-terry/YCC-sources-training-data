fun safeDiv (_, 0) = NONE
  | safeDiv (a, b) = SOME (a div b)

fun bind NONE _ = NONE
  | bind (SOME x) f = f x

fun showOpt NONE = "NONE"
  | showOpt (SOME n) = "SOME " ^ Int.toString n

val r1 = bind (safeDiv (100, 5)) (fn x => safeDiv (x, 2))
val r2 = bind (safeDiv (100, 0)) (fn x => safeDiv (x, 2))
val r3 = bind (safeDiv (10, 5)) (fn x => safeDiv (x, 0))

val () = print (showOpt r1 ^ "\n")
val () = print (showOpt r2 ^ "\n")
val () = print (showOpt r3 ^ "\n")
val () = print (Int.toString (getOpt (r2, ~1)) ^ "\n")
val () = print (showOpt (Option.map (fn x => x + 1) r1) ^ "\n")
val () = print (Bool.toString (Option.isSome r1) ^ "\n")
val () = print (showOpt (Option.filter (fn x => x > 100) r1) ^ "\n")
val () = print (showOpt (Option.join (SOME (SOME 7))) ^ "\n")
