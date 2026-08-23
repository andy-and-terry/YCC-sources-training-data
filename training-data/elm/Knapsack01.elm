module Knapsack01 exposing (knapsack)

import Array exposing (Array)


knapsack : List ( Int, Int ) -> Int -> Int
knapsack items capacity =
    let
        initial =
            Array.repeat (capacity + 1) 0

        final =
            List.foldl addItem initial items

        addItem ( weight, value ) table =
            List.range 0 capacity
                |> List.reverse
                |> List.foldl
                    (\cap acc ->
                        if weight <= cap then
                            let
                                without =
                                    Array.get cap acc |> Maybe.withDefault 0

                                withItem =
                                    (Array.get (cap - weight) acc |> Maybe.withDefault 0) + value
                            in
                            Array.set cap (max without withItem) acc

                        else
                            acc
                    )
                    table
    in
    Array.get capacity final |> Maybe.withDefault 0
