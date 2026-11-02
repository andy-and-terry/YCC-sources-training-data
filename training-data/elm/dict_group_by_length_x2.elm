module Main exposing (main)

import Dict exposing (Dict)
import Html exposing (text)

group : List String -> Dict Int (List String)
group =
    List.foldl (\w -> Dict.update (String.length w) (\v -> Just (w :: Maybe.withDefault [] v))) Dict.empty

main =
    text (Debug.toString (Dict.toList (group [ "a", "bb", "c", "dd" ])))
