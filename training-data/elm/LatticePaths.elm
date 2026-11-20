module LatticePaths exposing (lattice)

{-| Lattice paths: repeated prefix sums over a DP row. -}


prefixSums : List Int -> List Int
prefixSums row =
    List.foldl
        (\x ( total, acc ) -> ( total + x, ( total + x ) :: acc ))
        ( 0, [] )
        row
        |> Tuple.second
        |> List.reverse


lattice : Int -> Int
lattice n =
    List.foldl (\_ row -> prefixSums row) (List.repeat (n + 1) 1) (List.range 1 n)
        |> List.reverse
        |> List.head
        |> Maybe.withDefault 0
