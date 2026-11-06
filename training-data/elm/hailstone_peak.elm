module HailstonePeak exposing (peak)

{-| Highest value reached by the Collatz (hailstone) sequence from n. -}


peak : Int -> Int
peak n =
    peakHelp n n


peakHelp : Int -> Int -> Int
peakHelp n best =
    if n == 1 then
        best

    else
        let
            next =
                if modBy 2 n == 0 then
                    n // 2

                else
                    3 * n + 1
        in
        peakHelp next (max best next)
