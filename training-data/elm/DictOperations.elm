module DictOperations exposing (inventory, restock, totalItems)

import Dict exposing (Dict)


inventory : Dict String Int
inventory =
    Dict.fromList [ ( "apple", 5 ), ( "pear", 0 ), ( "kiwi", 12 ) ]


restock : String -> Int -> Dict String Int -> Dict String Int
restock name qty =
    Dict.update name (\current -> Just (Maybe.withDefault 0 current + qty))


totalItems : Dict String Int -> Int
totalItems =
    Dict.foldl (\_ qty acc -> acc + qty) 0


inStock : Dict String Int -> List String
inStock dict =
    dict
        |> Dict.filter (\_ qty -> qty > 0)
        |> Dict.keys
