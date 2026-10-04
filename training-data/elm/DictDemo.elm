module DictDemo exposing (inventory, restock, totalItems)

import Dict exposing (Dict)


inventory : Dict String Int
inventory =
    Dict.fromList [ ( "apple", 5 ), ( "pear", 2 ), ( "plum", 0 ) ]


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
    Dict.foldl (\_ qty acc -> qty + acc) 0 dict
