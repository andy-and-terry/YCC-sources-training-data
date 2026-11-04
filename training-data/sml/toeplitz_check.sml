fun isToeplitz (prev :: (cur :: rest)) =
      tl cur = List.take (prev, length cur - 1) andalso isToeplitz (cur :: rest)
  | isToeplitz _ = true

val () = print (Bool.toString (isToeplitz [[1,2,3],[4,1,2],[5,4,1]]) ^ "\n")
val () = print (Bool.toString (isToeplitz [[1,2],[2,2]]) ^ "\n")
