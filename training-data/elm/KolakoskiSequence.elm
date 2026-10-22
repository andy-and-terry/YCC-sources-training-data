module KolakoskiSequence exposing (kolakoski)

import Array exposing (Array)


kolakoski : Int -> List Int
kolakoski count =
    Array.fromList [ 1, 2, 2 ]
        |> grow count 2 1
        |> Array.slice 0 count
        |> Array.toList


grow : Int -> Int -> Int -> Array Int -> Array Int
grow count readIdx value arr =
    if Array.length arr >= count then
        arr

    else
        let
            runLength =
                Array.get readIdx arr |> Maybe.withDefault 1
        in
        grow count
            (readIdx + 1)
            (3 - value)
            (List.foldl Array.push arr (List.repeat runLength value))



-- kolakoski 20 == [1,2,2,1,1,2,1,2,2,1,2,2,1,1,2,1,1,2,2,1]
