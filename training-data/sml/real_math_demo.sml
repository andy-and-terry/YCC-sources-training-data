val x = 2.0
val () = print (Real.toString (Math.sqrt x) ^ "\n")
val () = print (Real.fmt (StringCvt.FIX (SOME 3)) Math.pi ^ "\n")
val () = print (Int.toString (Real.round 2.5) ^ " " ^ Int.toString (Real.round 3.5) ^ "\n")
val () = print (Int.toString (Real.floor ~2.1) ^ " " ^ Int.toString (Real.ceil ~2.1) ^ " " ^ Int.toString (Real.trunc ~2.9) ^ "\n")
val () = print (Real.toString (Real.fromInt 7 / 2.0) ^ "\n")
val () = print (Real.toString (Math.pow (2.0, 10.0)) ^ "\n")
val () = print (Real.toString (Math.ln 1.0) ^ "\n")
val () = print (Bool.toString (Real.isNan (0.0 / 0.0)) ^ "\n")
val () = print (Bool.toString (Real.== (0.1 + 0.2, 0.3)) ^ "\n")
val () = print (Bool.toString (Real.abs (0.1 + 0.2 - 0.3) < 1E~9) ^ "\n")
val () = print (Real.toString (Real.max (1.5, 2.5)) ^ "\n")

fun mean xs = foldl (op +) 0.0 xs / Real.fromInt (length xs)
fun variance xs =
  let val m = mean xs
  in mean (map (fn v => (v - m) * (v - m)) xs) end

val data = [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]
val () = print (Real.toString (mean data) ^ "\n")
val () = print (Real.toString (Math.sqrt (variance data)) ^ "\n")
val () = print (Real.toString (Real.rem (7.5, 2.0)) ^ "\n")
val () = print (case Real.fromString "3.25" of SOME r => Real.toString r | NONE => "bad")
val () = print "\n"
