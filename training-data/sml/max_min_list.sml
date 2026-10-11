fun maxList [] = NONE
  | maxList (x :: xs) = SOME (foldl Int.max x xs)

fun minList [] = NONE
  | minList (x :: xs) = SOME (foldl Int.min x xs)

fun show NONE = "n/a"
  | show (SOME v) = Int.toString v

val data = [7, ~2, 19, 4, 0]
val () = print ("max " ^ show (maxList data) ^ ", min " ^ show (minList data) ^ "\n")
val () = print ("empty " ^ show (maxList []) ^ "\n")
