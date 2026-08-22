fun isPrime n =
  if n < 2 then false
  else
    let
      fun check d = d * d > n orelse (n mod d <> 0 andalso check (d + 1))
    in
      check 2
    end

val primes = List.filter isPrime (List.tabulate (19, fn i => i + 2))
val () = print (String.concatWith " " (map Int.toString primes) ^ "\n")
