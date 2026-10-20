module Main exposing (main)

import Html exposing (text)

type Msg
    = Inc
    | Dec
    | Reset

update : Msg -> Int -> Int
update msg n =
    case msg of
        Inc -> n + 1
        Dec -> n - 1
        Reset -> 0

main =
    text (String.fromInt (List.foldl update 0 [ Inc, Inc, Dec ]))
