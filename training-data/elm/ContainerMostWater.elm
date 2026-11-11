module ContainerMostWater exposing (maxArea)

import Array


maxArea : List Int -> Int
maxArea heights =
    let
        h =
            Array.fromList heights

        at i =
            Array.get i h |> Maybe.withDefault 0

        go lo hi best =
            if lo >= hi then
                best

            else
                let
                    best_ =
                        max best (min (at lo) (at hi) * (hi - lo))
                in
                if at lo < at hi then
                    go (lo + 1) hi best_

                else
                    go lo (hi - 1) best_
    in
    go 0 (Array.length h - 1) 0



-- maxArea [ 1, 8, 6, 2, 5, 4, 8, 3, 7 ] == 49
