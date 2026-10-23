(* withtype lets a datatype declaration use type abbreviations that refer to it. *)
datatype expr =
    Num of int
  | Add of args
  | Mul of args
withtype args = expr list

fun eval (Num n) = n
  | eval (Add es) = List.foldl (fn (e, acc) => eval e + acc) 0 es
  | eval (Mul es) = List.foldl (fn (e, acc) => eval e * acc) 1 es

val e = Add [Num 2, Mul [Num 3, Num 4], Num 5]
val () = print (Int.toString (eval e) ^ "\n")
val () = print (Int.toString (eval (Mul [])) ^ "\n")
val () = print (Int.toString (eval (Add [Num 1, Add [Num 2, Num 3]])) ^ "\n")
