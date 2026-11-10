(* D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1) *)
fun delannoy (0, _) = 1
  | delannoy (_, 0) = 1
  | delannoy (m, n) = delannoy (m - 1, n) + delannoy (m, n - 1) + delannoy (m - 1, n - 1)

val () = print (String.concatWith " " (List.tabulate (6, fn n => Int.toString (delannoy (n, n)))) ^ "\n")
(* 1 3 13 63 321 1683 *)
