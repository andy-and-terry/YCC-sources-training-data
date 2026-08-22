module MergeSort exposing (mergeSort)


merge : List comparable -> List comparable -> List comparable
merge left right =
    case ( left, right ) of
        ( [], r ) ->
            r

        ( l, [] ) ->
            l

        ( lx :: lxs, rx :: rxs ) ->
            if lx <= rx then
                lx :: merge lxs right

            else
                rx :: merge left rxs


mergeSort : List comparable -> List comparable
mergeSort items =
    case items of
        [] ->
            []

        [ x ] ->
            [ x ]

        _ ->
            let
                mid =
                    List.length items // 2

                left =
                    List.take mid items

                right =
                    List.drop mid items
            in
            merge (mergeSort left) (mergeSort right)
