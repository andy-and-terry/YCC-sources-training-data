val r = 3.7

val () = print (Int.toString (floor r) ^ "\n")
val () = print (Int.toString (ceil r) ^ "\n")
val () = print (Int.toString (round r) ^ "\n")
val () = print (Int.toString (trunc r) ^ "\n")
val () = print (Int.toString (round 2.5) ^ " " ^ Int.toString (round 3.5) ^ "\n")
val () = print (Int.toString (floor ~2.5) ^ " " ^ Int.toString (trunc ~2.5) ^ "\n")

val () = print (Real.toString (real 7 / 2.0) ^ "\n")
val () = print (Real.toString (Real.fromInt 10) ^ "\n")

val avg = real (foldl (op +) 0 [1, 2, 3, 4]) / real 4
val () = print (Real.toString avg ^ "\n")

val () = print (Real.fmt (StringCvt.FIX (SOME 2)) 3.14159 ^ "\n")
val () = print (Real.fmt (StringCvt.SCI (SOME 2)) 12345.678 ^ "\n")

val () = print (case Int.fromString "123abc" of SOME n => Int.toString n | NONE => "bad")
val () = print "\n"
val () = print (case Int.fromString "xyz" of SOME n => Int.toString n | NONE => "bad")
val () = print "\n"
val () = print (case Real.fromString "2.5e2" of SOME x => Real.toString x | NONE => "bad")
val () = print "\n"

val () = print (Int.toString (~7 div 2) ^ " " ^ Int.toString (~7 mod 2) ^ "\n")
val () = print (Int.toString (Int.quot (~7, 2)) ^ " " ^ Int.toString (Int.rem (~7, 2)) ^ "\n")
val () = print (Real.toString (Math.sqrt 2.0) ^ "\n")
val () = print (Bool.toString (Real.isNan (0.0 / 0.0)) ^ "\n")
val () = print (Real.toString (Real.realFloor 2.9) ^ "\n")
