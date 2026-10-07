module ProxyPattern exposing (Image, cachedDisplay)

{-| The Gang-of-Four Proxy pattern needs no wrapper class in Elm: a proxy
that defers or caches expensive work is just a function guarding access
to another function, here memoizing a "load" step behind a `Dict`.
-}

import Dict exposing (Dict)


type alias Image =
    { filename : String, pixels : Int }


load : String -> Image
load filename =
    { filename = filename, pixels = String.length filename * 100 }


cachedDisplay : Dict String Image -> String -> ( Image, Dict String Image )
cachedDisplay cache filename =
    case Dict.get filename cache of
        Just image ->
            ( image, cache )

        Nothing ->
            let
                image =
                    load filename
            in
            ( image, Dict.insert filename image cache )
