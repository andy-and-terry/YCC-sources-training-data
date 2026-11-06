module BullsAndCows exposing (score)

{-| Bulls and Cows scoring for equal-length digit strings. -}


removeFirst : a -> List a -> List a
removeFirst x list =
    case list of
        [] ->
            []

        y :: ys ->
            if x == y then
                ys

            else
                y :: removeFirst x ys


score : String -> String -> ( Int, Int )
score secret guess =
    let
        pairs =
            List.map2 Tuple.pair (String.toList secret) (String.toList guess)

        bulls =
            List.length (List.filter (\( s, g ) -> s == g) pairs)

        rest =
            List.filter (\( s, g ) -> s /= g) pairs

        countCows gs pool =
            case gs of
                [] ->
                    0

                g :: more ->
                    if List.member g pool then
                        1 + countCows more (removeFirst g pool)

                    else
                        countCows more pool
    in
    ( bulls, countCows (List.map Tuple.second rest) (List.map Tuple.first rest) )
