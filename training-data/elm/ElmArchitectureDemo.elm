module ElmArchitectureDemo exposing (Model, Msg(..), init, subscriptions, update)

import Random
import Time


type alias Model =
    { count : Int
    , lastTick : Maybe Time.Posix
    }


type Msg
    = Tick Time.Posix
    | RollDice
    | DiceRolled Int


init : ( Model, Cmd Msg )
init =
    ( { count = 0, lastTick = Nothing }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            ( { model | lastTick = Just time }, Cmd.none )

        RollDice ->
            ( model, Random.generate DiceRolled (Random.int 1 6) )

        DiceRolled value ->
            ( { model | count = model.count + value }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 1000 Tick
