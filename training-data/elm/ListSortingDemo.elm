module ListSortingDemo exposing (Person, byAgeThenName, oldestFirst, sortedNames)


type alias Person =
    { name : String, age : Int }


people : List Person
people =
    [ { name = "Cy", age = 31 }
    , { name = "Ann", age = 25 }
    , { name = "Bo", age = 31 }
    ]


sortedNames : List String
sortedNames =
    people |> List.map .name |> List.sort


oldestFirst : List Person -> List Person
oldestFirst =
    List.sortBy (\p -> negate p.age)


byAgeThenName : List Person -> List Person
byAgeThenName =
    List.sortWith
        (\a b ->
            case compare b.age a.age of
                EQ ->
                    compare a.name b.name

                other ->
                    other
        )


-- byAgeThenName people == [ Bo, Cy, Ann ] (ages 31, 31, 25)
