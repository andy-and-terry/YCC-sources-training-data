fun safeDiv (_, 0) = NONE
  | safeDiv (a, b) = SOME (a div b)

fun show NONE = "none"
  | show (SOME n) = Int.toString n

val () = print (show (safeDiv (10, 2)) ^ " " ^ show (safeDiv (1, 0)) ^ "\n")
