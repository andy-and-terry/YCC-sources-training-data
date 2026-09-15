module LongestCommonSubsequence exposing (lcsLength)

import Array exposing (Array)


lcsLength : String -> String -> Int
lcsLength a b =
    let
        aChars =
            Array.fromList (String.toList a)

        bChars =
            Array.fromList (String.toList b)

        m =
            Array.length aChars

        n =
            Array.length bChars

        firstRow =
            Array.repeat (n + 1) 0

        table =
            List.range 1 m
                |> List.foldl (buildRow aChars bChars n) (Array.fromList [ firstRow ])
    in
    table
        |> Array.get m
        |> Maybe.andThen (Array.get n)
        |> Maybe.withDefault 0


buildRow : Array Char -> Array Char -> Int -> Int -> Array (Array Int) -> Array (Array Int)
buildRow aChars bChars n i rows =
    let
        prevRow =
            Array.get (i - 1) rows |> Maybe.withDefault Array.empty

        newRow =
            List.range 1 n
                |> List.foldl (fillCell aChars bChars prevRow i) (Array.repeat (n + 1) 0)
    in
    Array.push newRow rows


fillCell : Array Char -> Array Char -> Array Int -> Int -> Int -> Array Int -> Array Int
fillCell aChars bChars prevRow i j row =
    let
        value =
            if Array.get (i - 1) aChars == Array.get (j - 1) bChars then
                (Array.get (j - 1) prevRow |> Maybe.withDefault 0) + 1

            else
                max
                    (Array.get j prevRow |> Maybe.withDefault 0)
                    (Array.get (j - 1) row |> Maybe.withDefault 0)
    in
    Array.set j value row
