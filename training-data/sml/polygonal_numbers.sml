fun polygonal s n = ((s - 2) * n * n - (s - 4) * n) div 2

fun firstTen s = List.tabulate (10, fn i => polygonal s (i + 1))

fun show name s =
  print (name ^ ": " ^ String.concatWith " " (map Int.toString (firstTen s)) ^ "\n")

val () =
  (show "triangular" 3;
   show "pentagonal" 5;
   show "hexagonal" 6)
