module MatrixChainMultiplication exposing (minCost)

import Dict exposing (Dict)


minCost : List Int -> Int
minCost dims =
    let
        dim k =
            List.drop k dims |> List.head |> Maybe.withDefault 0

        n =
            List.length dims - 1

        finalTable =
            List.foldl (fillForLength n dim) Dict.empty (List.range 2 n)
    in
    Dict.get ( 1, n ) finalTable |> Maybe.withDefault 0


fillForLength : Int -> (Int -> Int) -> Int -> Dict ( Int, Int ) Int -> Dict ( Int, Int ) Int
fillForLength n dim chainLength table =
    List.range 1 (n - chainLength + 1)
        |> List.foldl
            (\i acc ->
                let
                    j =
                        i + chainLength - 1

                    cost k =
                        (Dict.get ( i, k ) acc |> Maybe.withDefault 0)
                            + (Dict.get ( k + 1, j ) acc |> Maybe.withDefault 0)
                            + dim (i - 1)
                            * dim k
                            * dim j

                    best =
                        List.range i (j - 1)
                            |> List.map cost
                            |> List.minimum
                            |> Maybe.withDefault 0
                in
                Dict.insert ( i, j ) best acc
            )
            table
