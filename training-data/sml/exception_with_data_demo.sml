exception NotFound of string
exception OutOfRange of int * int

fun lookup key [] = raise NotFound key
  | lookup key ((k, v) :: rest) = if k = key then v else lookup key rest

fun checkRange (n, lo, hi) =
    if n < lo orelse n > hi then raise OutOfRange (lo, hi) else n

val table = [("a", 1), ("b", 2)]

val r1 = lookup "b" table
val r2 = lookup "z" table
    handle NotFound k => (print ("missing: " ^ k ^ "\n"); ~1)

val () = print (Int.toString (r1 + r2) ^ "\n")

val msg = (checkRange (50, 0, 10); "ok")
    handle OutOfRange (lo, hi) =>
        "range " ^ Int.toString lo ^ ".." ^ Int.toString hi
val () = print (msg ^ "\n")

val d = (10 div 0) handle Div => ~999
val () = print (Int.toString d ^ "\n")
val s = (hd ([] : int list); "no") handle Empty => "empty list"
val () = print (s ^ "\n")
val () = (raise Fail "boom") handle Fail m => print (m ^ "\n")
