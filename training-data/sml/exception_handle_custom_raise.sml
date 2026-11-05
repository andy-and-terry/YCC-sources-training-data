exception NegativeArg of int

fun check n = if n < 0 then raise NegativeArg n else n

val r = (check ~5) handle NegativeArg k => k * 2
val _ = print (Int.toString r ^ "\n")
val s = (hd []) handle Empty => 0
val _ = print (Int.toString s ^ "\n")
