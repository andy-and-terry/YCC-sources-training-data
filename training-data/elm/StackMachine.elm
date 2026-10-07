module StackMachine exposing (Instr(..), run)


type Instr
    = Push Int
    | AddI
    | MulI
    | Dup
    | Swap


run : List Instr -> Maybe (List Int)
run =
    List.foldl step (Just [])


step : Instr -> Maybe (List Int) -> Maybe (List Int)
step instr maybeStack =
    case ( instr, maybeStack ) of
        ( _, Nothing ) ->
            Nothing

        ( Push n, Just s ) ->
            Just (n :: s)

        ( AddI, Just (a :: b :: s) ) ->
            Just (a + b :: s)

        ( MulI, Just (a :: b :: s) ) ->
            Just (a * b :: s)

        ( Dup, Just (a :: s) ) ->
            Just (a :: a :: s)

        ( Swap, Just (a :: b :: s) ) ->
            Just (b :: a :: s)

        _ ->
            Nothing
