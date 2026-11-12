exception Neg
fun safeSqrt x = if x < 0.0 then raise Neg else Math.sqrt x
val _ = print (Real.toString (safeSqrt 9.0 handle Neg => 0.0) ^ "\n")
val _ = print (Real.toString (safeSqrt ~1.0 handle Neg => 0.0) ^ "\n")
