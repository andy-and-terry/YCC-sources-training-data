fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n > 1 andalso go 2 end

val twins = List.filter (fn p => isPrime p andalso isPrime (p + 2)) (List.tabulate (46, fn i => i + 3))

val () = List.app (fn p => print ("(" ^ Int.toString p ^ ", " ^ Int.toString (p + 2) ^ ") ")) twins
val () = print "\n"
