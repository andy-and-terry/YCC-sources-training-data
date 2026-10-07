module ExpressionEvaluator exposing (Expr(..), eval)


type Expr
    = Num Float
    | Add Expr Expr
    | Mul Expr Expr
    | Div Expr Expr
    | Neg Expr


eval : Expr -> Result String Float
eval expr =
    case expr of
        Num n ->
            Ok n

        Add a b ->
            Result.map2 (+) (eval a) (eval b)

        Mul a b ->
            Result.map2 (*) (eval a) (eval b)

        Neg a ->
            Result.map negate (eval a)

        Div a b ->
            eval b
                |> Result.andThen
                    (\d ->
                        if d == 0 then
                            Err "division by zero"

                        else
                            Result.map (\n -> n / d) (eval a)
                    )
