module StatePattern exposing (State(..), dispense, insertCoin, selectItem)

{-| The Gang-of-Four State pattern needs no per-state classes in Elm: a
state is just a value of a custom type, and each transition is a plain
function from one state to the next, matched with `case`. Illegal
transitions simply return the state unchanged.
-}


type State
    = Idle
    | CoinInserted
    | Dispensing


insertCoin : State -> State
insertCoin state =
    case state of
        Idle ->
            CoinInserted

        other ->
            other


selectItem : State -> State
selectItem state =
    case state of
        CoinInserted ->
            Dispensing

        other ->
            other


dispense : State -> State
dispense state =
    case state of
        Dispensing ->
            Idle

        other ->
            other
