module RadixSort exposing (radixSort)


radixSort : List Int -> List Int
radixSort items =
    case items of
        [] ->
            []

        _ ->
            let
                maxVal =
                    List.foldl max 0 items
            in
            radixPass items 1 maxVal


radixPass : List Int -> Int -> Int -> List Int
radixPass items exp maxVal =
    if exp > maxVal then
        items

    else
        let
            buckets =
                List.foldl (addToBucket exp) (List.repeat 10 []) items

            next =
                List.concat buckets
        in
        radixPass next (exp * 10) maxVal


addToBucket : Int -> Int -> List (List Int) -> List (List Int)
addToBucket exp value buckets =
    let
        digit =
            modBy 10 (value // exp)
    in
    List.indexedMap
        (\i bucket ->
            if i == digit then
                bucket ++ [ value ]

            else
                bucket
        )
        buckets
