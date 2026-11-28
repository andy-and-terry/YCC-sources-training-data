module LyndonFactorization exposing (main)

import Html exposing (text)


-- Simple O(n^2) check-based factorization: grow the longest prefix that is
-- lexicographically <= every one of its proper suffixes (a Lyndon word).
isLyndon : String -> Bool
isLyndon w =
    List.range 1 (String.length w - 1)
        |> List.all (\i -> w < String.dropLeft i w)


factor : String -> List String
factor s =
    if String.isEmpty s then
        []

    else
        let
            len =
                List.range 1 (String.length s)
                    |> List.filter (\n -> isLyndon (String.left n s))
                    |> List.maximum
                    |> Maybe.withDefault 1
        in
        String.left len s :: factor (String.dropLeft len s)


main =
    text (String.join " " (factor "banana"))
