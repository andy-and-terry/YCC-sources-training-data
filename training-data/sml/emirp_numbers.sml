fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n >= 2 andalso go 2 end

fun rev n =
  let fun go (0, acc) = acc
        | go (m, acc) = go (m div 10, acc * 10 + m mod 10)
  in go (n, 0) end

val emirps = List.filter (fn p => rev p <> p andalso isPrime p andalso isPrime (rev p))
                         (List.tabulate (198, fn i => i + 2))
val _ = print (String.concatWith " " (map Int.toString emirps) ^ "\n")
(* 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199 *)
