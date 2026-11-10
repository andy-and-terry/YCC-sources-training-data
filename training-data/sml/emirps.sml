fun isPrime n =
  n >= 2 andalso
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in go 2 end

fun rev n = valOf (Int.fromString (implode (List.rev (explode (Int.toString n)))))

fun collect (n, 0, acc) = List.rev acc
  | collect (n, left, acc) =
      let val r = rev n
      in if r <> n andalso isPrime n andalso isPrime r
         then collect (n + 1, left - 1, n :: acc)
         else collect (n + 1, left, acc)
      end

val () = print (String.concatWith " " (map Int.toString (collect (2, 10, []))) ^ "\n")
(* 13 17 31 37 71 73 79 97 107 113 *)
