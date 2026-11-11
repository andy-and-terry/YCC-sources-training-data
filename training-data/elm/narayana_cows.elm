module NarayanaCows exposing (main)

-- Narayana's cows N(n)=N(n-1)+N(n-3)

import Html exposing (text)


extend : List Int -> List Int
extend acc =
    let
        n =
            List.length acc

        at k =
            acc |> List.drop (n - k) |> List.head |> Maybe.withDefault 0
    in
    acc ++ [ at 1 + at 3 ]


main =
    List.foldl (\_ acc -> extend acc) [ 1, 1, 1 ] (List.range 1 7)
        |> List.map String.fromInt
        |> String.join " "
        |> text
