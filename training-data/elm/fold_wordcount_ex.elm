module FoldWordcountEx exposing (wordCount)

import Dict exposing (Dict)


wordCount : String -> Dict String Int
wordCount text =
    text
        |> String.words
        |> List.foldl
            (\w acc -> Dict.update w (\v -> Just (Maybe.withDefault 0 v + 1)) acc)
            Dict.empty
