module LuckyNumbers exposing (lucky)


lucky : Int -> List Int
lucky limit =
    List.range 1 limit
        |> List.filter (\n -> modBy 2 n == 1)
        |> sieve 1


sieve : Int -> List Int -> List Int
sieve idx nums =
    case List.head (List.drop idx nums) of
        Just step ->
            if step > List.length nums then
                nums

            else
                sieve (idx + 1) (removeEvery step nums)

        Nothing ->
            nums


removeEvery : Int -> List Int -> List Int
removeEvery step nums =
    nums
        |> List.indexedMap Tuple.pair
        |> List.filter (\( i, _ ) -> modBy step (i + 1) /= 0)
        |> List.map Tuple.second



-- lucky 50 == [1,3,7,9,13,15,21,25,31,33,37,43,49]
