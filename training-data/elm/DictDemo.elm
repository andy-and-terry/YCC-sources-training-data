module DictDemo exposing (ageOf, incrementAge, initialAges, namesOver30)

import Dict exposing (Dict)


initialAges : Dict String Int
initialAges =
    Dict.fromList
        [ ( "Alice", 30 )
        , ( "Bob", 25 )
        , ( "Carol", 35 )
        ]


ageOf : String -> Dict String Int -> Maybe Int
ageOf name ages =
    Dict.get name ages


incrementAge : String -> Dict String Int -> Dict String Int
incrementAge name ages =
    Dict.update name (Maybe.map (\age -> age + 1)) ages


namesOver30 : Dict String Int -> List String
namesOver30 ages =
    ages
        |> Dict.filter (\_ age -> age > 30)
        |> Dict.keys
