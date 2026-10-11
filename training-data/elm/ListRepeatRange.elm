module ListRepeatRange exposing (checkerboardRow, multiplicationTable)


checkerboardRow : Int -> List String
checkerboardRow n =
    List.range 0 (n - 1)
        |> List.map
            (\i ->
                if modBy 2 i == 0 then
                    "#"

                else
                    "."
            )


multiplicationTable : Int -> List (List Int)
multiplicationTable n =
    List.range 1 n
        |> List.map (\row -> List.map (\col -> row * col) (List.range 1 n))
