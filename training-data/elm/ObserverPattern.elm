module ObserverPattern exposing (Observer, loudObserver, notifyAll, quietObserver, subscribe)

{-| The Gang-of-Four Observer pattern needs no subject/observer classes in
Elm: an "observer" is just a function that reacts to a change, and
"subscribing" means adding it to a plain list. Notifying every observer is
a single `List.map` over that list, no registration machinery required.
-}


type alias Observer state =
    state -> String


subscribe : Observer state -> List (Observer state) -> List (Observer state)
subscribe observer observers =
    observer :: observers


notifyAll : List (Observer state) -> state -> List String
notifyAll observers state =
    List.map (\observer -> observer state) observers


loudObserver : Observer Int
loudObserver value =
    String.toUpper ("value is now " ++ String.fromInt value ++ "!")


quietObserver : Observer Int
quietObserver value =
    "value: " ++ String.fromInt value
