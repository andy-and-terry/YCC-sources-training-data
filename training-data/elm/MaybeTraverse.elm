module MaybeTraverse exposing (allJust)


allJust : List (Maybe a) -> Maybe (List a)
allJust items =
    List.foldr (Maybe.map2 (::)) (Just []) items
