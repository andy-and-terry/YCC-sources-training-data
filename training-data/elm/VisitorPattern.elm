module VisitorPattern exposing (Expr(..), evaluate, render)

{-| The Gang-of-Four Visitor pattern needs no double-dispatch mechanism in
Elm: since a custom type's variants are fixed and known, any function can
pattern match over all of them and act as a "visitor" without touching the
type definition itself. Adding a new operation is just a new function,
not a new class hierarchy.
-}


type Expr
    = Num Int
    | Add Expr Expr
    | Mul Expr Expr


evaluate : Expr -> Int
evaluate expr =
    case expr of
        Num n ->
            n

        Add left right ->
            evaluate left + evaluate right

        Mul left right ->
            evaluate left * evaluate right


render : Expr -> String
render expr =
    case expr of
        Num n ->
            String.fromInt n

        Add left right ->
            "(" ++ render left ++ " + " ++ render right ++ ")"

        Mul left right ->
            "(" ++ render left ++ " * " ++ render right ++ ")"
