module DictDemo exposing (inventory, restock, totalItems, wordCounts)

import Dict exposing (Dict)


inventory : Dict String Int
inventory =
    Dict.fromList [ ( "apples", 5 ), ( "pears", 0 ), ( "plums", 12 ) ]


restock : String -> Int -> Dict String Int -> Dict String Int
restock item amount =
    Dict.update item
        (\current ->
            case current of
                Just n ->
                    Just (n + amount)

                Nothing ->
                    Just amount
        )


totalItems : Dict String Int -> Int
totalItems =
    Dict.foldl (\_ count acc -> acc + count) 0


wordCounts : String -> Dict String Int
wordCounts text =
    text
        |> String.words
        |> List.foldl
            (\w -> Dict.update w (Maybe.withDefault 0 >> (+) 1 >> Just))
            Dict.empty
