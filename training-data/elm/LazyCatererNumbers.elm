module LazyCatererNumbers exposing (pieces, lazyCaterer)

-- Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
-- lazyCaterer == [ 1, 2, 4, 7, 11, 16, 22, 29, 37, 46 ]


pieces : Int -> Int
pieces n =
    n * (n + 1) // 2 + 1


lazyCaterer : List Int
lazyCaterer =
    List.range 0 9 |> List.map pieces
