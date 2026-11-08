module RailFenceCipher exposing (encode)


encode : Int -> String -> String
encode rails s =
    let
        period =
            2 * (rails - 1)

        rail i =
            let
                m =
                    modBy period i
            in
            if m < rails then
                m

            else
                period - m
    in
    String.toList s
        |> List.indexedMap (\i c -> ( rail i, i, c ))
        |> List.sortBy (\( r, i, _ ) -> ( r, i ))
        |> List.map (\( _, _, c ) -> c)
        |> String.fromList
