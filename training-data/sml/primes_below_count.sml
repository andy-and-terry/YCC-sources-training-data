fun sieve [] = []
  | sieve (p :: xs) = p :: sieve (List.filter (fn x => x mod p <> 0) xs)

fun countPrimesBelow n =
  if n < 3 then 0 else length (sieve (List.tabulate (n - 2, fn i => i + 2)))

val () = print (Int.toString (countPrimesBelow 100) ^ "\n")
