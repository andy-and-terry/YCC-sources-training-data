(* Bitwise operations with the Word structure *)
val a : word = 0wxF0
val b : word = 0wx3C

fun show label w = print (label ^ ": " ^ Word.fmt StringCvt.HEX w ^ "\n")

val () = show "and" (Word.andb (a, b))
val () = show "or" (Word.orb (a, b))
val () = show "xor" (Word.xorb (a, b))
val () = show "shl" (Word.<< (b, 0w2))
val () = show "shr" (Word.>> (a, 0w4))

fun popcount w = if w = 0w0 then 0 else Word.toInt (Word.andb (w, 0w1)) + popcount (Word.>> (w, 0w1))
val () = print (Int.toString (popcount 0wxFF) ^ "\n")
