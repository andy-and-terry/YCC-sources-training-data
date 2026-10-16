datatype expr = Num of int | Var of string | Add of expr * expr | Mul of expr * expr

fun simplify (Add (Num 0, e)) = simplify e
  | simplify (Add (e, Num 0)) = simplify e
  | simplify (Mul (Num 1, e)) = simplify e
  | simplify (Mul (e, Num 1)) = simplify e
  | simplify (Mul (Num 0, _)) = Num 0
  | simplify (Mul (_, Num 0)) = Num 0
  | simplify (Add (a, b)) = Add (simplify a, simplify b)
  | simplify (Mul (a, b)) = Mul (simplify a, simplify b)
  | simplify e = e

fun toString (Num n) = Int.toString n
  | toString (Var v) = v
  | toString (Add (a, b)) = "(" ^ toString a ^ " + " ^ toString b ^ ")"
  | toString (Mul (a, b)) = toString a ^ " * " ^ toString b

val e = Add (Mul (Num 1, Var "x"), Mul (Num 0, Var "y"))
val () = print (toString e ^ " => " ^ toString (simplify e) ^ "\n")
