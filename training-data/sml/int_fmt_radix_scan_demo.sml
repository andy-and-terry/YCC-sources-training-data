val () = print (Int.fmt StringCvt.BIN 10 ^ "\n")
val () = print (Int.fmt StringCvt.OCT 64 ^ "\n")
val () = print (Int.fmt StringCvt.HEX 255 ^ "\n")
val () = print (Int.fmt StringCvt.DEC ~42 ^ "\n")

fun show NONE = "none"
  | show (SOME n) = Int.toString n

val () = print (show (Int.fromString "123abc") ^ "\n")
val () = print (show (Int.fromString "abc") ^ "\n")
val () = print (show (StringCvt.scanString (Int.scan StringCvt.HEX) "ff") ^ "\n")
val () = print (show (StringCvt.scanString (Int.scan StringCvt.BIN) "1011") ^ "\n")
val () = print (show (Int.fromString "~7") ^ "\n")
val () = print (Int.toString (valOf Int.maxInt) ^ "\n")
