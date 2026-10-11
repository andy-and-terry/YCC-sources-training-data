module UpdateCounterMsg exposing (Model, Msg(..), init, update)


type alias Model =
    { count : Int
    , step : Int
    }


type Msg
    = Increment
    | Decrement
    | Reset
    | SetStep Int


init : Model
init =
    { count = 0, step = 1 }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + model.step }

        Decrement ->
            { model | count = model.count - model.step }

        Reset ->
            { model | count = 0 }

        SetStep n ->
            { model | step = max 1 n }
