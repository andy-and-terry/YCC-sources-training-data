fun isPerfectSquare n =
  n >= 0 andalso
  let val r = Real.round (Math.sqrt (Real.fromInt n))
  in r * r = n end

val squares = List.filter isPerfectSquare (List.tabulate (30, fn i => i))
val () = print (String.concatWith " " (map Int.toString squares) ^ "\n")
