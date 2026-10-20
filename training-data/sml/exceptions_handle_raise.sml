exception NegativeInput of int
exception Empty

fun check n = if n < 0 then raise NegativeInput n else n

fun head [] = raise Empty
  | head (x :: _) = x

fun safeDiv (a, b) = a div b handle Div => 0

val _ = print (Int.toString (check 5) ^ "\n")
val _ = (check ~3; ()) handle NegativeInput n => print ("negative: " ^ Int.toString n ^ "\n")
val _ = print (Int.toString (head [] handle Empty => ~1) ^ "\n")
val _ = print (Int.toString (safeDiv (10, 0)) ^ "\n")
val _ = (hd [] : int; ()) handle Empty => print "empty\n" | _ => print "other\n"
val _ = (valOf NONE : int; ()) handle Option => print "no value\n"
val _ = (valOf (Int.fromString "x"); ()) handle Option => print "bad parse\n"
val _ = (raise Fail "custom failure") handle Fail msg => print (msg ^ "\n")
val _ = (Array.sub (Array.array (2, 0), 5); ()) handle Subscript => print "subscript\n"
val r = (raise Overflow) handle Overflow => "overflow caught"
val _ = print (r ^ "\n")
