module AliquotSequence exposing (aliquot, aliquotSum)

-- Aliquot sequence: replace n by the sum of its proper divisors.
-- aliquot 12 == [12,16,15,9,4,3,1]


aliquotSum : Int -> Int
aliquotSum n =
    List.range 1 (n // 2)
        |> List.filter (\d -> remainderBy d n == 0)
        |> List.sum


aliquot : Int -> List Int
aliquot n =
    aliquotHelp n 1


aliquotHelp : Int -> Int -> List Int
aliquotHelp n count =
    if n <= 1 || count >= 20 then
        [ n ]

    else
        n :: aliquotHelp (aliquotSum n) (count + 1)
