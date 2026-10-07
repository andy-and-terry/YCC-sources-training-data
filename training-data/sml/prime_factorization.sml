fun factorize n =
  let
    fun loop (n, d, acc) =
      if n = 1 then rev acc
      else if d * d > n then rev (n :: acc)
      else if n mod d = 0 then loop (n div d, d, d :: acc)
      else loop (n, d + 1, acc)
  in
    loop (n, 2, [])
  end

val () = print (String.concatWith " " (map Int.toString (factorize 360)) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (factorize 97)) ^ "\n")
