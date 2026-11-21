module BouncyNumbers exposing (bouncyCount, isBouncy)

-- Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
-- bouncyCount == 525


isBouncy : Int -> Bool
isBouncy n =
    let
        d =
            String.fromInt n |> String.toList

        up =
            List.sort d
    in
    d /= up && d /= List.reverse up


bouncyCount : Int
bouncyCount =
    List.range 1 999 |> List.filter isBouncy |> List.length
