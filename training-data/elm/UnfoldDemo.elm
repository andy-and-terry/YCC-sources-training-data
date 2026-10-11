module UnfoldDemo exposing (digitsOf, unfold)


unfold : (s -> Maybe ( a, s )) -> s -> List a
unfold step state =
    case step state of
        Nothing ->
            []

        Just ( value, next ) ->
            value :: unfold step next


digitsOf : Int -> List Int
digitsOf n =
    unfold
        (\k ->
            if k <= 0 then
                Nothing

            else
                Just ( modBy 10 k, k // 10 )
        )
        n
        |> List.reverse
