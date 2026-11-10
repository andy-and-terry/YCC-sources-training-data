fun isPrime n =
  n >= 2 andalso
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in go 2 end

val pairs = List.filter (fn p => isPrime p andalso isPrime (p + 2)) (List.tabulate (76, fn i => i + 3))

val () = List.app (fn p => print ("(" ^ Int.toString p ^ "," ^ Int.toString (p + 2) ^ ") ")) pairs
val () = print "\n"
(* (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73) *)
