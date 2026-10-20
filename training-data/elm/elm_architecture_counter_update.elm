module ElmArchitectureCounterUpdate exposing (Model, Msg(..), init, update, view)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int, history : List Int }


type Msg
    = Increment
    | Decrement
    | Reset
    | Add Int


init : Model
init =
    { count = 0, history = [] }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            record { model | count = model.count + 1 }

        Decrement ->
            record { model | count = model.count - 1 }

        Reset ->
            { count = 0, history = [] }

        Add n ->
            record { model | count = model.count + n }


record : Model -> Model
record m =
    { m | history = m.count :: List.take 4 m.history }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , text (String.fromInt model.count)
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Reset ] [ text "reset" ]
        ]
