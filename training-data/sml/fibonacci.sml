fun fibonacci 0 = 0
  | fibonacci 1 = 1
  | fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

val () = print (String.concatWith " " (map (Int.toString o fibonacci) [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) ^ "\n")
