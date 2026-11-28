module RailFenceCipher exposing (encrypt)


rail : Int -> Int -> Int
rail k i =
    let
        cycle =
            2 * (k - 1)

        r =
            modBy cycle i
    in
    if r < k then
        r

    else
        cycle - r


encrypt : String -> Int -> String
encrypt text k =
    String.toList text
        |> List.indexedMap (\i c -> ( rail k i, i, c ))
        |> List.sortBy (\( r, i, _ ) -> ( r, i ))
        |> List.map (\( _, _, c ) -> c)
        |> String.fromList
