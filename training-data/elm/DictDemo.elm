module DictDemo exposing (inventory, restock, totalItems)

import Dict exposing (Dict)


inventory : Dict String Int
inventory =
    Dict.fromList [ ( "apple", 3 ), ( "pear", 0 ), ( "plum", 7 ) ]


restock : String -> Int -> Dict String Int -> Dict String Int
restock name qty =
    Dict.update name
        (\current ->
            case current of
                Just n ->
                    Just (n + qty)

                Nothing ->
                    Just qty
        )


totalItems : Dict String Int -> Int
totalItems =
    Dict.foldl (\_ n acc -> n + acc) 0
