val xs = [SOME 3, NONE, SOME 7, NONE, SOME 1]

val present = List.mapPartial (fn x => x) xs
val total = foldl op+ 0 present
val firstOrZero = getOpt (List.hd xs, 0)
val missing = getOpt (List.nth (xs, 1), ~1)

val () = print (Int.toString total ^ "\n")
val () = print (Int.toString firstOrZero ^ "\n")
val () = print (Int.toString missing ^ "\n")
val () = print (Bool.toString (isSome (List.find (fn x => x = SOME 7) xs)) ^ "\n")
