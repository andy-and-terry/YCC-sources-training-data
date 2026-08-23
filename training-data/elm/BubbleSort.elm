module BubbleSort exposing (bubbleSort)


pass : List comparable -> ( List comparable, Bool )
pass items =
    case items of
        a :: b :: rest ->
            if a > b then
                let
                    ( sortedRest, changed ) =
                        pass (a :: rest)
                in
                ( b :: sortedRest, True )

            else
                let
                    ( sortedRest, changed ) =
                        pass (b :: rest)
                in
                ( a :: sortedRest, changed )

        _ ->
            ( items, False )


bubbleSort : List comparable -> List comparable
bubbleSort items =
    let
        ( result, changed ) =
            pass items
    in
    if changed then
        bubbleSort result

    else
        result
