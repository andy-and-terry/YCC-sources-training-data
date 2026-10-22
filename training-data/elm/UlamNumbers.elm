module UlamNumbers exposing (ulam)


ulam : Int -> List Int
ulam count =
    grow count [ 1, 2 ] 3


grow : Int -> List Int -> Int -> List Int
grow count terms candidate =
    if List.length terms >= count then
        terms

    else if ways terms candidate == 1 then
        grow count (terms ++ [ candidate ]) (candidate + 1)

    else
        grow count terms (candidate + 1)


ways : List Int -> Int -> Int
ways terms c =
    terms
        |> List.filter (\x -> 2 * x < c && List.member (c - x) terms)
        |> List.length



-- ulam 15 == [1,2,3,4,6,8,11,13,16,18,26,28,36,38,47]
