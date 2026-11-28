fun popcount 0w0 = 0
  | popcount n = 1 + popcount (Word.andb (n, n - 0w1))

val () = print (Int.toString (popcount 0wxB7) ^ "\n")
