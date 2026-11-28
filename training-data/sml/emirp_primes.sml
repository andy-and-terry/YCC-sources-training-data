fun isPrime n =
  let fun go i = i * i > n orelse (n mod i <> 0 andalso go (i + 1))
  in n >= 2 andalso go 2 end

fun rev n =
  let fun go (0, acc) = acc
        | go (m, acc) = go (m div 10, acc * 10 + m mod 10)
  in go (n, 0) end

val emirps = List.filter (fn p => isPrime p andalso rev p <> p andalso isPrime (rev p))
                         (List.tabulate (98, fn i => i + 2))

val () = print (String.concatWith " " (map Int.toString emirps) ^ "\n")
