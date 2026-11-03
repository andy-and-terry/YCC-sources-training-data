module TriangularNumbers exposing (triangular)


triangular : Int -> List Int
triangular count =
    List.range 1 count
        |> List.foldl (\n ( sum, acc ) -> ( sum + n, (sum + n) :: acc )) ( 0, [] )
        |> Tuple.second
        |> List.reverse
