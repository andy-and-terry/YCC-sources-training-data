module NextGreaterElement exposing (nextGreater)

import Array exposing (Array)


nextGreater : List Int -> List Int
nextGreater numbers =
    let
        arr =
            Array.fromList numbers

        n =
            Array.length arr

        indices =
            List.range 0 (n - 1)

        ( _, result ) =
            List.foldr (visit arr) ( [], Array.repeat n -1 ) indices
    in
    Array.toList result


visit : Array Int -> Int -> ( List Int, Array Int ) -> ( List Int, Array Int )
visit arr i ( stack, result ) =
    case Array.get i arr of
        Nothing ->
            ( stack, result )

        Just value ->
            let
                trimmed =
                    dropSmaller arr value stack
            in
            case trimmed of
                [] ->
                    ( i :: trimmed, result )

                top :: _ ->
                    case Array.get top arr of
                        Just topValue ->
                            ( i :: trimmed, Array.set i topValue result )

                        Nothing ->
                            ( i :: trimmed, result )


dropSmaller : Array Int -> Int -> List Int -> List Int
dropSmaller arr value stack =
    case stack of
        [] ->
            []

        top :: rest ->
            case Array.get top arr of
                Just topValue ->
                    if topValue <= value then
                        dropSmaller arr value rest

                    else
                        stack

                Nothing ->
                    stack
