module ListFunctionsPipeline exposing (evensSquared, groupByLength, total, wordFrequency)

import Dict exposing (Dict)


evensSquared : List Int -> List Int
evensSquared nums =
    nums
        |> List.filter (\n -> modBy 2 n == 0)
        |> List.map (\n -> n * n)


total : List Int -> Int
total =
    List.foldl (+) 0


groupByLength : List String -> Dict Int (List String)
groupByLength words =
    List.foldr
        (\w acc -> Dict.update (String.length w) (\existing -> Just (w :: Maybe.withDefault [] existing)) acc)
        Dict.empty
        words


wordFrequency : String -> List ( String, Int )
wordFrequency text =
    text
        |> String.toLower
        |> String.words
        |> List.foldl (\w d -> Dict.update w (Maybe.map ((+) 1) >> Maybe.withDefault 1 >> Just) d) Dict.empty
        |> Dict.toList
        |> List.sortBy (\( w, n ) -> ( negate n, w ))
