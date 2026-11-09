exception Negative of int

fun check n = if n < 0 then raise Negative n else n

val _ = (check ~5; ()) handle Negative n => print ("negative " ^ Int.toString n ^ "\n")
