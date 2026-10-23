module LuckyNumbers exposing (lucky)


dropEvery : Int -> List Int -> List Int
dropEvery k xs =
    let
        go i ys =
            case ys of
                [] ->
                    []

                y :: rest ->
                    if i == k then
                        go 1 rest

                    else
                        y :: go (i + 1) rest
    in
    go 1 xs


sieve : Int -> List Int -> List Int
sieve idx xs =
    case List.head (List.drop idx xs) of
        Nothing ->
            xs

        Just k ->
            if k > List.length xs then
                xs

            else
                sieve (idx + 1) (dropEvery k xs)


lucky : Int -> List Int
lucky limit =
    List.range 1 (limit - 1)
        |> List.filter (\n -> modBy 2 n == 1)
        |> sieve 1



-- lucky 100 == [1,3,7,9,13,15,21,25,31,33,37,43,49,51,63,67,69,73,75,79,87,93,99]
