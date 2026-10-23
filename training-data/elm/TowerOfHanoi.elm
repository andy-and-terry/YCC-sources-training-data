module TowerOfHanoi exposing (main, moves)

import Html exposing (Html, text)


type Peg
    = A
    | B
    | C


pegName : Peg -> String
pegName peg =
    case peg of
        A ->
            "A"

        B ->
            "B"

        C ->
            "C"


moves : Int -> Peg -> Peg -> Peg -> List ( Peg, Peg )
moves n from to via =
    if n <= 0 then
        []

    else
        moves (n - 1) from via to
            ++ [ ( from, to ) ]
            ++ moves (n - 1) via to from


main : Html msg
main =
    let
        result =
            moves 3 A C B

        describe ( from, to ) =
            pegName from ++ "->" ++ pegName to
    in
    text
        (String.join ", " (List.map describe result)
            ++ " ("
            ++ String.fromInt (List.length result)
            ++ " moves)"
        )
