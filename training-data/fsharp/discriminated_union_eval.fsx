type Expr =
    | Num of int
    | Add of Expr * Expr
    | Neg of Expr

let rec eval = function
    | Num n -> n
    | Add (a, b) -> eval a + eval b
    | Neg e -> -(eval e)

printfn "%d" (eval (Add (Num 5, Neg (Num 2))))
