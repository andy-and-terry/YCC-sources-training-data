module CenteredSquareNumbers exposing (centeredSquares)

-- Centered square numbers: n^2 + (n+1)^2.
-- centeredSquares == [1,5,13,25,41,61,85,113,145,181]


centeredSquares : List Int
centeredSquares =
    List.map (\n -> n * n + (n + 1) * (n + 1)) (List.range 0 9)
