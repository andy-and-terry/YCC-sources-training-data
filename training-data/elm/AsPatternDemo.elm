module AsPatternDemo exposing (duplicateHead, describeList)


duplicateHead : List a -> List a
duplicateHead list =
    case list of
        ((x :: _) as all) ->
            x :: all

        [] ->
            []


describeList : List Int -> String
describeList list =
    case list of
        [] ->
            "empty"

        [ x ] ->
            "one: " ++ String.fromInt x

        [ x, y ] ->
            "two: " ++ String.fromInt (x + y)

        x :: _ ->
            "many starting with " ++ String.fromInt x
