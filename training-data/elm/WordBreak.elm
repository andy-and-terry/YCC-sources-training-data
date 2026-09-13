module WordBreak exposing (canSegment)

import Array exposing (Array)
import Set exposing (Set)


canSegment : Set String -> String -> Bool
canSegment dictionary word =
    let
        n =
            String.length word

        dp =
            List.foldl (step dictionary word) (Array.set 0 True (Array.repeat (n + 1) False)) (List.range 1 n)
    in
    Array.get n dp |> Maybe.withDefault False


step : Set String -> String -> Int -> Array Bool -> Array Bool
step dictionary word end table =
    let
        canReach =
            List.range 0 (end - 1)
                |> List.any
                    (\start ->
                        (Array.get start table |> Maybe.withDefault False)
                            && Set.member (String.slice start end word) dictionary
                    )
    in
    Array.set end canReach table
