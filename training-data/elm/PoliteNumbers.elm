module PoliteNumbers exposing (politeWays, table)

{-| Ways to write n as a sum of two or more consecutive positive integers.
-}


politeWays : Int -> Int
politeWays n =
    List.range 2 n
        |> List.filter (\k -> k * (k + 1) // 2 <= n)
        |> List.filter (\k -> modBy k (n - k * (k - 1) // 2) == 0)
        |> List.length


table : List Int
table =
    List.map politeWays (List.range 1 16)



-- table == [ 0, 0, 1, 0, 1, 1, 1, 0, 2, 1, 1, 1, 1, 1, 3, 0 ]
