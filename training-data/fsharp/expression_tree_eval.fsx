type Expr =
    | Lit of float
    | Neg of Expr
    | Add of Expr * Expr
    | Sub of Expr * Expr
    | Mul of Expr * Expr
    | Div of Expr * Expr

let rec eval expr =
    match expr with
    | Lit n -> n
    | Neg e -> -(eval e)
    | Add(a, b) -> eval a + eval b
    | Sub(a, b) -> eval a - eval b
    | Mul(a, b) -> eval a * eval b
    | Div(a, b) -> eval a / eval b

// (3 + 4) * -2
let expr = Mul(Add(Lit 3.0, Lit 4.0), Neg(Lit 2.0))

printfn "%f" (eval expr)
printfn "%f" (eval (Div(Lit 10.0, Sub(Lit 5.0, Lit 3.0))))
