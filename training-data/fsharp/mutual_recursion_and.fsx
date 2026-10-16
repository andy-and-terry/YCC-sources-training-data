let rec isEven n =
    if n = 0 then true else isOdd (n - 1)

and isOdd n =
    if n = 0 then false else isEven (n - 1)

printfn "%b %b" (isEven 10) (isOdd 7)

type Expr =
    | Num of int
    | Add of Term * Term
and Term =
    | Lit of Expr
    | Neg of Term

let rec evalExpr = function
    | Num n -> n
    | Add (a, b) -> evalTerm a + evalTerm b
and evalTerm = function
    | Lit e -> evalExpr e
    | Neg t -> -(evalTerm t)

printfn "%d" (evalExpr (Add(Lit(Num 5), Neg(Lit(Num 3)))))
