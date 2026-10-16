module MaybeWithDefaultDemo exposing (displayName, firstOr)


displayName : Maybe String -> String
displayName name =
    Maybe.withDefault "anonymous" name


firstOr : a -> List a -> a
firstOr fallback items =
    List.head items
        |> Maybe.withDefault fallback
