val pi = 3.14159265358979

val () = print (Real.fmt (StringCvt.FIX (SOME 2)) pi ^ "\n")
val () = print (Real.fmt (StringCvt.SCI (SOME 3)) 123456.789 ^ "\n")
val () = print (Real.toString 0.5 ^ "\n")
val () = print (Int.toString (Real.round 2.6) ^ "\n")
val () = print (Int.toString (Real.floor ~2.1) ^ "\n")
val () = print (Int.toString (Real.ceil 2.1) ^ "\n")
val () = print (Int.toString (Real.trunc ~2.9) ^ "\n")
