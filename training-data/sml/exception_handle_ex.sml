exception Neg of int

fun check n = if n < 0 then raise Neg n else n

val r1 = check 5 handle Neg _ => 0
val r2 = check ~3 handle Neg k => k * 10
val () = print (Int.toString r1 ^ " " ^ Int.toString r2 ^ "\n")
