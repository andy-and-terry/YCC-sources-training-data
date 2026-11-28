fun delannoy (0, _) = 1
  | delannoy (_, 0) = 1
  | delannoy (m, n) = delannoy (m - 1, n) + delannoy (m, n - 1) + delannoy (m - 1, n - 1)

val () = print (String.concatWith " " (List.tabulate (8, fn i => Int.toString (delannoy (i, i)))) ^ "\n")
