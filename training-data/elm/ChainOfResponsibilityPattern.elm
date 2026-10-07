module ChainOfResponsibilityPattern exposing (Handler, handle, levelOneHandler, levelThreeHandler, levelTwoHandler)

{-| The Gang-of-Four Chain of Responsibility pattern needs no linked
handler objects in Elm: each handler is just a function that may decline
by returning `Nothing`, and the chain is a plain list tried in order until
one of them succeeds.
-}


type alias Handler =
    Int -> Maybe String


handle : List Handler -> Int -> Maybe String
handle handlers request =
    case handlers of
        [] ->
            Nothing

        handler :: rest ->
            case handler request of
                Just result ->
                    Just result

                Nothing ->
                    handle rest request


levelOneHandler : Handler
levelOneHandler priority =
    if priority <= 1 then
        Just "resolved by level one support"

    else
        Nothing


levelTwoHandler : Handler
levelTwoHandler priority =
    if priority <= 2 then
        Just "resolved by level two support"

    else
        Nothing


levelThreeHandler : Handler
levelThreeHandler priority =
    if priority <= 3 then
        Just "resolved by level three support"

    else
        Nothing
