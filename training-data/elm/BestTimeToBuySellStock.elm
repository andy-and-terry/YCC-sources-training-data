module BestTimeToBuySellStock exposing (maxProfit)


maxProfit : List Int -> Int
maxProfit prices =
    case prices of
        [] ->
            0

        first :: rest ->
            let
                ( _, best ) =
                    List.foldl step ( first, 0 ) rest

                step price ( minPrice, bestProfit ) =
                    ( min minPrice price, max bestProfit (price - minPrice) )
            in
            best
