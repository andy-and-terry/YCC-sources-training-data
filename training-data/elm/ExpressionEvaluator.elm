module ExpressionEvaluator exposing (Expr(..), eval, toString)


type Expr
    = Num Float
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr


eval : Expr -> Result String Float
eval expr =
    case expr of
        Num n ->
            Ok n

        Add a b ->
            Result.map2 (+) (eval a) (eval b)

        Sub a b ->
            Result.map2 (-) (eval a) (eval b)

        Mul a b ->
            Result.map2 (*) (eval a) (eval b)

        Div a b ->
            eval b
                |> Result.andThen
                    (\divisor ->
                        if divisor == 0 then
                            Err "division by zero"

                        else
                            eval a |> Result.map (\x -> x / divisor)
                    )


toString : Expr -> String
toString expr =
    case expr of
        Num n ->
            String.fromFloat n

        Add a b ->
            "(" ++ toString a ++ " + " ++ toString b ++ ")"

        Sub a b ->
            "(" ++ toString a ++ " - " ++ toString b ++ ")"

        Mul a b ->
            "(" ++ toString a ++ " * " ++ toString b ++ ")"

        Div a b ->
            "(" ++ toString a ++ " / " ++ toString b ++ ")"
