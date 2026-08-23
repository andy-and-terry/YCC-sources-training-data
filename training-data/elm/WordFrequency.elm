module WordFrequency exposing (wordFrequency)

import Dict exposing (Dict)


wordFrequency : String -> Dict String Int
wordFrequency text =
    text
        |> String.toLower
        |> String.words
        |> List.foldl
            (\word acc ->
                Dict.update word (\count -> Just (Maybe.withDefault 0 count + 1)) acc
            )
            Dict.empty
