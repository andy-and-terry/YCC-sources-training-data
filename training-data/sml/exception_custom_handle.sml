exception Underflow of string

fun pop [] = raise Underflow "empty stack"
  | pop (x :: xs) = (x, xs)

val _ = (pop []; ()) handle Underflow m => print ("caught: " ^ m ^ "\n")
