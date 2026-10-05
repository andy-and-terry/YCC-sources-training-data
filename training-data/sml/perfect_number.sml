fun divisorSum n =
  let
    fun loop (d, acc) =
      if d > n div 2 then acc
      else if n mod d = 0 then loop (d + 1, acc + d)
      else loop (d + 1, acc)
  in
    loop (1, 0)
  end

fun isPerfect n = n > 1 andalso divisorSum n = n

val perfects = List.filter isPerfect (List.tabulate (1000, fn i => i + 1))
val () = print (String.concatWith ", " (map Int.toString perfects) ^ "\n")
