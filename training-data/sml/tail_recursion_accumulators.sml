fun sumTo n = let fun go (0, acc) = acc | go (i, acc) = go (i - 1, acc + i) in go (n, 0) end
fun fact n = let fun go (0, acc) = acc | go (i, acc) = go (i - 1, acc * IntInf.fromInt i) in go (n, 1) end
fun fib n = let fun go (0, a, _) = a | go (i, a, b) = go (i - 1, b, a + b) in go (n, 0, 1) end
fun rev' l = let fun go ([], acc) = acc | go (x :: r, acc) = go (r, x :: acc) in go (l, []) end
fun gcd (a, 0) = a | gcd (a, b) = gcd (b, a mod b)
fun collatz n = let fun go (1, s) = s | go (m, s) = go (if m mod 2 = 0 then m div 2 else 3 * m + 1, s + 1) in go (n, 0) end
fun isPrime n = n > 1 andalso let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1)) in go 2 end
val _ = print (Int.toString (sumTo 1000000) ^ "\n")
val _ = print (IntInf.toString (fact 25) ^ "\n")
val _ = print (Int.toString (fib 40) ^ " " ^ Int.toString (gcd (84, 36)) ^ " " ^ Int.toString (collatz 27) ^ "\n")
val _ = print (String.concatWith "," (map Int.toString (List.filter isPrime (List.tabulate (30, fn i => i)))) ^ "\n")
val _ = print (String.concatWith "," (map Int.toString (rev' [1, 2, 3])) ^ "\n")
