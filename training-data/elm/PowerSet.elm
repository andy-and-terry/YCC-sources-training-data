module PowerSet exposing (powerSet)


powerSet : List a -> List (List a)
powerSet items =
    List.foldr
        (\item subsets -> subsets ++ List.map ((::) item) subsets)
        [ [] ]
        items
