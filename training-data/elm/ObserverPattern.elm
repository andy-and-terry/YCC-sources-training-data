module ObserverPattern exposing (Subject, notify, publish, subscribe)

{-| The GoF Observer pattern in a language without mutable objects: a
`Subject` just carries its current value plus a list of "observer" functions
that get run whenever the value changes. This is close to how Elm's own
architecture treats subscriptions, only fully explicit here.
-}


type alias Subject a =
    { value : a
    , observers : List (a -> String)
    }


subscribe : (a -> String) -> Subject a -> Subject a
subscribe observer subject =
    { subject | observers = subject.observers ++ [ observer ] }


{-| Update the subject's value and return the messages every observer
produces in response, in subscription order.
-}
publish : a -> Subject a -> ( Subject a, List String )
publish newValue subject =
    let
        updated =
            { subject | value = newValue }
    in
    ( updated, notify updated )


notify : Subject a -> List String
notify subject =
    List.map (\observer -> observer subject.value) subject.observers
