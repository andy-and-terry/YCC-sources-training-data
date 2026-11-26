(* Emirps below 200; expect 15. *)
fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n > 1 andalso go 2 end
fun count lo hi pred = if lo > hi then 0 else (if pred lo then 1 else 0) + count (lo + 1) hi pred

fun rev n = valOf (Int.fromString (implode (List.rev (explode (Int.toString n)))))
val _ = print (Int.toString (count 2 199 (fn n => rev n <> n andalso isPrime n andalso isPrime (rev n))) ^ "\n")
