type Expr =
    | Num of int
    | Add of Expr * Expr
    | Mul of Expr * Expr

let rec eval = function
    | Num n -> n
    | Add (a, b) -> eval a + eval b
    | Mul (a, b) -> eval a * eval b

printfn "%d" (eval (Add (Num 2, Mul (Num 3, Num 4))))
