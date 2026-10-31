module OddCubesIdentity exposing (main)

import Html


cubeFromOdds : Int -> Int
cubeFromOdds n =
    let
        start =
            n * n - n + 1
    in
    List.range 0 (n - 1)
        |> List.map (\i -> start + 2 * i)
        |> List.sum


main =
    List.range 1 5
        |> List.map (\n -> ( n, cubeFromOdds n, cubeFromOdds n == n ^ 3 ))
        |> Debug.toString
        |> Html.text
