fun fact n = if n <= 1 then 1 else n * fact (n - 1)
fun comb (n, k) = fact n div (fact k * fact (n - k))
fun lah (n, k) = comb (n - 1, k - 1) * fact n div fact k

fun row n = String.concatWith " " (List.tabulate (n, fn i => Int.toString (lah (n, i + 1))))

val () = List.app (fn n => print (row n ^ "\n")) [1, 2, 3, 4, 5]
