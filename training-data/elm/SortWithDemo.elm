module SortWithDemo exposing (byAgeThenName, descending, people)


type alias Person =
    { name : String, age : Int }


people : List Person
people =
    [ { name = "Ann", age = 31 }, { name = "Bob", age = 25 }, { name = "Cy", age = 31 } ]


descending : List comparable -> List comparable
descending =
    List.sortWith (\a b -> compare b a)


byAgeThenName : List Person -> List Person
byAgeThenName =
    List.sortWith
        (\a b ->
            case compare a.age b.age of
                EQ ->
                    compare a.name b.name

                other ->
                    other
        )
