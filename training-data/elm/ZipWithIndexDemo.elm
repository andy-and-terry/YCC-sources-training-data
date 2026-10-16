module ZipWithIndexDemo exposing (indexed, labelLines)


indexed : List a -> List ( Int, a )
indexed =
    List.indexedMap Tuple.pair


labelLines : List String -> List String
labelLines lines =
    lines
        |> List.indexedMap (\i line -> String.fromInt (i + 1) ++ ". " ++ line)
