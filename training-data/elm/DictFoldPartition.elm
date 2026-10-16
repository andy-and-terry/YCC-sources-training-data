module DictFoldPartition exposing (splitByThreshold, totalValues)

import Dict exposing (Dict)


totalValues : Dict String Int -> Int
totalValues =
    Dict.foldl (\_ v acc -> v + acc) 0


splitByThreshold : Int -> Dict String Int -> ( Dict String Int, Dict String Int )
splitByThreshold limit =
    Dict.partition (\_ v -> v >= limit)
