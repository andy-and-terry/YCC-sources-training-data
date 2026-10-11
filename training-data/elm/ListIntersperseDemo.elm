module ListIntersperseDemo exposing (commaSeparated, interleave)


commaSeparated : List String -> String
commaSeparated items =
    items
        |> List.intersperse ", "
        |> String.concat


interleave : List a -> List a -> List a
interleave xs ys =
    case ( xs, ys ) of
        ( x :: xrest, y :: yrest ) ->
            x :: y :: interleave xrest yrest

        ( [], rest ) ->
            rest

        ( rest, [] ) ->
            rest
