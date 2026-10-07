module DictBasics exposing (inventory, restock, totalItems)

import Dict exposing (Dict)


inventory : Dict String Int
inventory =
    Dict.fromList [ ( "apple", 5 ), ( "pear", 0 ), ( "kiwi", 12 ) ]


restock : String -> Int -> Dict String Int -> Dict String Int
restock name amount =
    Dict.update name
        (\current ->
            case current of
                Just n ->
                    Just (n + amount)

                Nothing ->
                    Just amount
        )


totalItems : Dict String Int -> Int
totalItems dict =
    Dict.foldl (\_ qty acc -> acc + qty) 0 dict


inStock : Dict String Int -> List String
inStock dict =
    dict
        |> Dict.filter (\_ qty -> qty > 0)
        |> Dict.keys
