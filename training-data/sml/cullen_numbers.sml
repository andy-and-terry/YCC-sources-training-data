fun pow2 0 = 1
  | pow2 n = 2 * pow2 (n - 1)

fun cullen n = n * pow2 n + 1

val () = List.app (fn n => print (Int.toString n ^ " " ^ Int.toString (cullen n) ^ "\n")) [1, 2, 3, 4, 5]
