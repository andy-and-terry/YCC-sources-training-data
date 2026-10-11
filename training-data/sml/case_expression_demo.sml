fun describe n =
  case (n mod 3, n mod 5) of
    (0, 0) => "fizzbuzz"
  | (0, _) => "fizz"
  | (_, 0) => "buzz"
  | _ => Int.toString n

fun classify xs =
  case xs of
    [] => "empty"
  | [_] => "singleton"
  | [_, _] => "pair"
  | _ => "many"

val () = List.app (fn n => print (describe n ^ " ")) [1, 3, 5, 15]
val () = print "\n"
val () = print (classify [1, 2] ^ " " ^ classify [] ^ " " ^ classify [1, 2, 3] ^ "\n")
