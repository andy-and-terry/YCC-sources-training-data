module MaybeChainEx exposing (main)

import Html exposing (text)


parse : String -> Maybe Int
parse =
    String.toInt


addStrings : String -> String -> Maybe Int
addStrings a b =
    Maybe.map2 (+) (parse a) (parse b)


main =
    text (Debug.toString [ addStrings "3" "4", addStrings "x" "1" ])
