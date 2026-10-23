module HtmlViewDemo exposing (view)

import Html exposing (Html, button, div, li, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type Msg
    = Increment
    | Decrement


type alias Model =
    { count : Int
    , items : List String
    }


view : Model -> Html Msg
view model =
    div [ class "counter" ]
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.count) ]
        , button [ onClick Increment ] [ text "+" ]
        , ul [] (List.map (\item -> li [] [ text item ]) model.items)
        ]
