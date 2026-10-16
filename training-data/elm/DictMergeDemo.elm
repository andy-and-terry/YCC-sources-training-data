module DictMergeDemo exposing (combine)

import Dict exposing (Dict)


combine : Dict String Int -> Dict String Int -> Dict String Int
combine left right =
    Dict.merge
        (\k a acc -> Dict.insert k a acc)
        (\k a b acc -> Dict.insert k (a + b) acc)
        (\k b acc -> Dict.insert k b acc)
        left
        right
        Dict.empty
