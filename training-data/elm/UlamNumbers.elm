module UlamNumbers exposing (ulam)


ulam : Int -> List Int
ulam count =
    let
        ways candidate terms =
            terms
                |> List.filter
                    (\x -> x * 2 < candidate && List.member (candidate - x) terms)
                |> List.length

        go candidate acc n =
            if n >= count then
                List.reverse acc

            else if ways candidate acc == 1 then
                go (candidate + 1) (candidate :: acc) (n + 1)

            else
                go (candidate + 1) acc n
    in
    go 3 [ 2, 1 ] 2



-- ulam 15 == [1,2,3,4,6,8,11,13,16,18,26,28,36,38,47]
