module PerrinSequence exposing (main)

-- Perrin sequence P(n)=P(n-2)+P(n-3)

import Html exposing (text)


extend : List Int -> List Int
extend acc =
    let
        n =
            List.length acc

        at k =
            acc |> List.drop (n - k) |> List.head |> Maybe.withDefault 0
    in
    acc ++ [ at 2 + at 3 ]


main =
    List.foldl (\_ acc -> extend acc) [ 3, 0, 2 ] (List.range 1 7)
        |> List.map String.fromInt
        |> String.join " "
        |> text
