module MonotonicStack exposing (nextGreaterElements)


nextGreaterElements : List Int -> List Int
nextGreaterElements nums =
    let
        indexed =
            List.indexedMap Tuple.pair nums

        results =
            List.foldl step ( [], List.repeat (List.length nums) -1 ) indexed

        step ( index, value ) ( stack, results_ ) =
            let
                ( poppedStack, updated ) =
                    resolve value stack results_
            in
            ( index :: poppedStack, updated )

        resolve value stack results_ =
            case stack of
                top :: rest ->
                    if Maybe.withDefault -1 (getAt top nums) < value then
                        resolve value rest (setAt top value results_)

                    else
                        ( stack, results_ )

                [] ->
                    ( stack, results_ )

        getAt i list =
            List.drop i list |> List.head

        setAt i value list =
            List.indexedMap
                (\idx v ->
                    if idx == i then
                        value

                    else
                        v
                )
                list
    in
    Tuple.second results
