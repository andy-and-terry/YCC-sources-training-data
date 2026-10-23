fun approxEq eps (a : real, b : real) = Real.abs (a - b) < eps

val sum = 0.1 + 0.2
val () = print (Bool.toString (sum = 0.3) ^ "\n")
val () = print (Bool.toString (Real.== (sum, 0.3)) ^ "\n")
val () = print (Bool.toString (approxEq 1E~9 (sum, 0.3)) ^ "\n")

val () = print (Bool.toString (Real.isNan (0.0 / 0.0)) ^ "\n")
val () = print (Bool.toString (Real.isFinite (1.0 / 0.0)) ^ "\n")

val () =
  print (case Real.compare (1.5, 2.5) of
           LESS => "less\n"
         | EQUAL => "equal\n"
         | GREATER => "greater\n")

val () = print (Int.toString (Real.round 2.5) ^ "\n")
val () = print (Int.toString (Real.round 3.5) ^ "\n")
val () = print (Int.toString (Real.floor ~1.5) ^ "\n")
val () = print (Int.toString (Real.trunc ~1.5) ^ "\n")
val () = print (Real.fmt (StringCvt.FIX (SOME 3)) 3.14159 ^ "\n")
