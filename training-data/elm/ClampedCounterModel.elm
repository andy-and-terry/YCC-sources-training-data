module ClampedCounterModel exposing (Msg(..), update)


type Msg
    = Increment
    | Decrement
    | Reset
    | Set Int


update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            min 10 (model + 1)

        Decrement ->
            max 0 (model - 1)

        Reset ->
            0

        Set n ->
            clamp 0 10 n
