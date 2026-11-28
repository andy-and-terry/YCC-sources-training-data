module PatienceLis exposing (main)

import Html exposing (text)


insertTail : Int -> List Int -> List Int
insertTail x tails =
    case tails of
        [] ->
            [ x ]

        t :: rest ->
            if t >= x then
                x :: rest

            else
                t :: insertTail x rest


lisLength : List Int -> Int
lisLength =
    List.foldl insertTail [] >> List.length


main =
    text (String.fromInt (lisLength [ 10, 9, 2, 5, 3, 7, 101, 18 ]))
