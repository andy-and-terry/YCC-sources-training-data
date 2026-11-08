module DeltaEncoding exposing (decode, encode)


encode : List Int -> List Int
encode xs =
    case xs of
        [] ->
            []

        x :: rest ->
            x :: List.map2 (-) rest xs


decode : List Int -> List Int
decode ds =
    List.scanl (+) 0 ds |> List.drop 1
