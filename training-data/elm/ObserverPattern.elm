module ObserverPattern exposing (Subject, empty, notify, subscribe)

{-| The Gang-of-Four Observer pattern in Elm: a "subject" is just a record
carrying its current value alongside its list of observer callbacks. There is
no mutable observer list to manage - `subscribe` returns a new `Subject`
value, and `notify` folds the new value through every registered callback.
-}


type alias Subject a =
    { value : a
    , observers : List (a -> String)
    }


empty : a -> Subject a
empty value =
    { value = value, observers = [] }


subscribe : (a -> String) -> Subject a -> Subject a
subscribe observer subject =
    { subject | observers = observer :: subject.observers }


notify : a -> Subject a -> ( Subject a, List String )
notify newValue subject =
    let
        updated =
            { subject | value = newValue }
    in
    ( updated, List.map (\observer -> observer newValue) updated.observers )
