module GroupAnagrams exposing (groupAnagrams)

import Dict exposing (Dict)


groupAnagrams : List String -> Dict String (List String)
groupAnagrams words =
    List.foldl
        (\word acc ->
            Dict.update (sortLetters word)
                (\existing -> Just (word :: Maybe.withDefault [] existing))
                acc
        )
        Dict.empty
        words


sortLetters : String -> String
sortLetters word =
    word
        |> String.toList
        |> List.sort
        |> String.fromList
