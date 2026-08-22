exception DivisionByZero

fun safeDivide (a, 0) = raise DivisionByZero
  | safeDivide (a, b) = a div b

val () = print (Int.toString (safeDivide (10, 2)) ^ "\n")
val () =
  (print (Int.toString (safeDivide (5, 0)) ^ "\n"))
  handle DivisionByZero => print "error: division by zero\n"
