fun popcount 0 = 0
  | popcount n = (n mod 2) + popcount (n div 2)

fun gould n = Word.toInt (Word.<< (0w1, Word.fromInt (popcount n)))

val () = print (String.concatWith " " (List.tabulate (16, Int.toString o gould)) ^ "\n")
