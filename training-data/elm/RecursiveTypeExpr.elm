module RecursiveTypeExpr exposing (Expr(..), eval, show)


type Expr
    = Num Int
    | Add Expr Expr
    | Mul Expr Expr
    | Neg Expr


eval : Expr -> Int
eval expr =
    case expr of
        Num n ->
            n

        Add a b ->
            eval a + eval b

        Mul a b ->
            eval a * eval b

        Neg a ->
            negate (eval a)


show : Expr -> String
show expr =
    case expr of
        Num n ->
            String.fromInt n

        Add a b ->
            "(" ++ show a ++ " + " ++ show b ++ ")"

        Mul a b ->
            show a ++ " * " ++ show b

        Neg a ->
            "-" ++ show a
