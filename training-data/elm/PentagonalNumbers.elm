module PentagonalNumbers exposing (pentagonal)

-- Pentagonal numbers: n(3n-1)/2.
-- pentagonal == [1,5,12,22,35,51,70,92,117,145]


pentagonal : List Int
pentagonal =
    List.map (\n -> n * (3 * n - 1) // 2) (List.range 1 10)
