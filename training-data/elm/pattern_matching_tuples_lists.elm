module PatternMatchingTuplesLists exposing (classify, pairs, sumPairs, take3)


classify : ( Int, Int ) -> String
classify point =
    case point of
        ( 0, 0 ) ->
            "origin"

        ( x, 0 ) ->
            "x-axis " ++ String.fromInt x

        ( 0, y ) ->
            "y-axis " ++ String.fromInt y

        ( x, y ) ->
            if x == y then
                "diagonal"

            else
                "plane"


take3 : List a -> List a
take3 list =
    case list of
        a :: b :: c :: _ ->
            [ a, b, c ]

        shorter ->
            shorter


pairs : List a -> List ( a, a )
pairs list =
    case list of
        a :: b :: rest ->
            ( a, b ) :: pairs rest

        _ ->
            []


sumPairs : List ( Int, Int ) -> Int
sumPairs =
    List.foldl (\( a, b ) acc -> acc + a + b) 0
