fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n > 1 andalso go 2 end

fun goldbach n =
  List.filter (fn p => isPrime p andalso isPrime (n - p)) (List.tabulate (n div 2 - 1, fn i => i + 2))

val () = List.app (fn p => print (Int.toString p ^ " + " ^ Int.toString (28 - p) ^ "\n")) (goldbach 28)
