(* Ways to write n as a sum of two or more consecutive positive integers. *)
fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

fun politeWays n =
  length (List.filter
            (fn k => k * (k + 1) div 2 <= n andalso (n - k * (k - 1) div 2) mod k = 0)
            (range (2, n)))

val () = print (String.concatWith " " (map (Int.toString o politeWays) (range (1, 16))) ^ "\n")
