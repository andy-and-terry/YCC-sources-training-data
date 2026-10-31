fun digitProduct 0 = 1
  | digitProduct n = (n mod 10) * digitProduct (n div 10)

fun persistence n = if n < 10 then 0 else 1 + persistence (digitProduct n)

val () = List.app (fn n =>
  print (Int.toString n ^ " " ^ Int.toString (persistence n) ^ "\n")) [39, 77, 999, 10]
