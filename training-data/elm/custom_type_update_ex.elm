module CustomTypeUpdateEx exposing (Msg(..), update)


type Msg
    = Increment
    | Decrement
    | Reset
    | Set Int


update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0

        Set n ->
            n
