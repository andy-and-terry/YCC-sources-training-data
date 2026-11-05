module Main exposing (main)

import Dict exposing (Dict)
import Html exposing (text)


freq : List String -> Dict String Int
freq =
    List.foldl (\w d -> Dict.update w (\m -> Just (Maybe.withDefault 0 m + 1)) d) Dict.empty


main =
    text (Debug.toString (Dict.toList (freq [ "a", "b", "a" ])))
