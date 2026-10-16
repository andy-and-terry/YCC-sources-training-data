fun rotateLeft (xs, n) =
  let
    val len = length xs
  in
    if len = 0 then xs
    else
      let val k = n mod len
      in List.drop (xs, k) @ List.take (xs, k) end
  end

fun show xs = "[" ^ String.concatWith "," (map Int.toString xs) ^ "]\n"

val () = print (show (rotateLeft ([1,2,3,4,5], 2)))
val () = print (show (rotateLeft ([1,2,3,4,5], 7)))
val () = print (show (rotateLeft ([], 3)))
