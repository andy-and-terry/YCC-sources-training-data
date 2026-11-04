module ZigzagConvert exposing (zigzag)


zigzag : String -> Int -> String
zigzag s rows =
    if rows == 1 || rows >= String.length s then
        s

    else
        let
            period =
                2 * (rows - 1)

            rowOf i =
                let
                    k =
                        modBy period i
                in
                if k < rows then
                    k

                else
                    period - k

            indexed =
                String.toList s |> List.indexedMap (\i c -> ( rowOf i, c ))
        in
        List.range 0 (rows - 1)
            |> List.concatMap (\r -> indexed |> List.filter (\( row, _ ) -> row == r) |> List.map Tuple.second)
            |> String.fromList
