module CoinChange exposing (minCoins)

import Array exposing (Array)


minCoins : List Int -> Int -> Maybe Int
minCoins coins amount =
    let
        table =
            List.foldl step (Array.repeat (amount + 1) Nothing |> Array.set 0 (Just 0)) (List.range 1 amount)

        step n acc =
            let
                options =
                    coins
                        |> List.filter (\c -> c <= n)
                        |> List.filterMap (\c -> Array.get (n - c) acc |> Maybe.andThen identity)
            in
            case List.minimum options of
                Just m ->
                    Array.set n (Just (m + 1)) acc

                Nothing ->
                    acc
    in
    Array.get amount table |> Maybe.andThen identity
