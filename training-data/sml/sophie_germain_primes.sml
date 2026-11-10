fun isPrime n =
  n >= 2 andalso
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in go 2 end

fun collect (p, 0, acc) = List.rev acc
  | collect (p, left, acc) =
      if isPrime p andalso isPrime (2 * p + 1)
      then collect (p + 1, left - 1, p :: acc)
      else collect (p + 1, left, acc)

val () = print (String.concatWith " " (map Int.toString (collect (2, 10, []))) ^ "\n")
(* 2 3 5 11 23 29 41 53 83 89 *)
