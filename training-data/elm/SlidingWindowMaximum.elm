module SlidingWindowMaximum exposing (maxSlidingWindow)

import Array exposing (Array)


maxSlidingWindow : Int -> List Int -> List Int
maxSlidingWindow k numbers =
    let
        arr =
            Array.fromList numbers

        n =
            Array.length arr

        windowMax start =
            List.range start (start + k - 1)
                |> List.filterMap (\i -> Array.get i arr)
                |> List.maximum
                |> Maybe.withDefault 0
    in
    if k <= 0 || k > n then
        []

    else
        List.range 0 (n - k)
            |> List.map windowMax
