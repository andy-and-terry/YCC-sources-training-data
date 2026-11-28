module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

type Msg = Inc | Dec | Reset

update : Msg -> Int -> Int
update msg n =
    case msg of
        Inc -> n + 1
        Dec -> n - 1
        Reset -> 0

view : Int -> Html Msg
view n =
    div [] [ button [ onClick Dec ] [ text "-" ], text (String.fromInt n), button [ onClick Inc ] [ text "+" ] ]

main = Browser.sandbox { init = 0, update = update, view = view }
