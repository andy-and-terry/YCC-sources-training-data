module MemoFibonacci exposing (fib)

import Dict exposing (Dict)


fib : Int -> Int
fib n =
    Tuple.first (fibMemo n Dict.empty)


fibMemo : Int -> Dict Int Int -> ( Int, Dict Int Int )
fibMemo n memo =
    if n < 2 then
        ( n, memo )

    else
        case Dict.get n memo of
            Just v ->
                ( v, memo )

            Nothing ->
                let
                    ( a, memo1 ) =
                        fibMemo (n - 1) memo

                    ( b, memo2 ) =
                        fibMemo (n - 2) memo1

                    result =
                        a + b
                in
                ( result, Dict.insert n result memo2 )
