module SternDiatomic exposing (stern)

import Array exposing (Array)


stern : Int -> List Int
stern count =
    List.foldl step (Array.fromList [ 0, 1 ]) (List.range 2 (count - 1))
        |> Array.toList
        |> List.take count


step : Int -> Array Int -> Array Int
step i seq =
    let
        at k =
            Array.get k seq |> Maybe.withDefault 0

        h =
            i // 2

        value =
            if modBy 2 i == 0 then
                at h

            else
                at h + at (h + 1)
    in
    Array.push value seq



-- stern 15 == [0,1,1,2,1,3,2,3,1,4,3,5,2,5,3]
