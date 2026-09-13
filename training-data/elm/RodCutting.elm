module RodCutting exposing (maxRevenue)

import Array exposing (Array)


maxRevenue : List Int -> Int -> Int
maxRevenue prices length =
    let
        priceArr =
            Array.fromList prices

        dp =
            List.foldl step (Array.repeat (length + 1) 0) (List.range 1 length)

        step n table =
            List.range 1 n
                |> List.foldl
                    (\cut acc ->
                        case ( Array.get (cut - 1) priceArr, Array.get (n - cut) acc, Array.get n acc ) of
                            ( Just price, Just rest, Just best ) ->
                                Array.set n (max best (price + rest)) acc

                            _ ->
                                acc
                    )
                    table
    in
    Array.get length dp |> Maybe.withDefault 0
