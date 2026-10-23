(* Word8 arithmetic wraps around modulo 256. *)
val a : Word8.word = 0w250
val b : Word8.word = 0w10

val () = print (Int.toString (Word8.toInt (a + b)) ^ "\n")
val () = print (Int.toString (Word8.toInt (b - a)) ^ "\n")
val () = print (Word8.toString (Word8.andb (0wxF0, 0wx3C)) ^ "\n")
val () = print (Word8.toString (Word8.xorb (0wxFF, 0wx0F)) ^ "\n")
val () = print (Word8.toString (Word8.notb 0wx0F) ^ "\n")
val () = print (Int.toString (Word8.toInt (Word8.<< (0w1, 0w7))) ^ "\n")

val bytes = Word8Vector.fromList [0w72, 0w105]
val () = print (Byte.bytesToString bytes ^ "\n")
val () = print (Int.toString (Word8Vector.length bytes) ^ "\n")
val () = print (Int.toString (Word8.toInt (Byte.charToByte #"A")) ^ "\n")
