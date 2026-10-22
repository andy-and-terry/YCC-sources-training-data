module AliquotSequence exposing (aliquot)


aliquot : Int -> List Int
aliquot n =
    if n == 0 then
        [ 0 ]

    else
        n :: aliquot (properSum n)


properSum : Int -> Int
properSum n =
    List.range 1 (n - 1)
        |> List.filter (\d -> modBy d n == 0)
        |> List.sum



-- aliquot 12 == [12,16,15,9,4,3,1,0]
