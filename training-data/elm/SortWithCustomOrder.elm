module SortWithCustomOrder exposing (byLengthThenAlpha, descending, sortPeople)


descending : comparable -> comparable -> Order
descending a b =
    compare b a


byLengthThenAlpha : String -> String -> Order
byLengthThenAlpha a b =
    case compare (String.length a) (String.length b) of
        EQ ->
            compare a b

        other ->
            other


type alias Person =
    { name : String, age : Int }


sortPeople : List Person -> List Person
sortPeople =
    List.sortWith
        (\a b ->
            case compare b.age a.age of
                EQ ->
                    compare a.name b.name

                other ->
                    other
        )



-- List.sortWith descending [3, 1, 2]                 == [3, 2, 1]
-- List.sortWith byLengthThenAlpha ["bb", "a", "ab"]  == ["a", "ab", "bb"]
