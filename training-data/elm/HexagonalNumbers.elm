module HexagonalNumbers exposing (hexagonal)

-- Hexagonal numbers: n(2n-1).
-- hexagonal == [1,6,15,28,45,66,91,120,153,190]


hexagonal : List Int
hexagonal =
    List.map (\n -> n * (2 * n - 1)) (List.range 1 10)
