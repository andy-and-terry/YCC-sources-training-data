fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n >= 2 andalso go 2 end

fun isPalindrome n =
  let val s = Int.toString n
  in s = String.implode (rev (String.explode s)) end

val result = List.filter (fn n => isPalindrome n andalso isPrime n)
                         (List.tabulate (198, fn i => i + 2))
val _ = print (String.concatWith " " (map Int.toString result) ^ "\n")
(* 2 3 5 7 11 101 131 151 181 191 *)
