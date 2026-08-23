module MaxSubarray exposing (kadane)


kadane : List Int -> Int
kadane items =
    case items of
        [] ->
            0

        h :: t ->
            let
                ( best, _ ) =
                    List.foldl step ( h, h ) t

                step x ( bestSoFar, current ) =
                    let
                        newCurrent =
                            max x (current + x)
                    in
                    ( max bestSoFar newCurrent, newCurrent )
            in
            best
