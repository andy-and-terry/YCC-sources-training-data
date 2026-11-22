module PracticalNumbers exposing (isPractical, practicalNumbers)

-- Practical numbers: every m in 1..n is a sum of distinct divisors of n.
-- practicalNumbers == [ 1, 2, 4, 6, 8, 12, 16, 18, 20, 24, 28, 30, 32, 36, 40 ]

import Set exposing (Set)


isPractical : Int -> Bool
isPractical n =
    let
        divisors =
            List.range 1 n |> List.filter (\d -> modBy d n == 0)

        grow d reach =
            Set.union reach (Set.map (\r -> r + d) reach)

        reachable =
            List.foldl grow (Set.singleton 0) divisors
    in
    List.range 1 n |> List.all (\m -> Set.member m reachable)


practicalNumbers : List Int
practicalNumbers =
    List.range 1 40 |> List.filter isPractical
