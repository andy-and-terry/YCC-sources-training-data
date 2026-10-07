module TrappingRainWater exposing (trap)

import Array exposing (Array)


trap : List Int -> Int
trap heights =
    let
        arr =
            Array.fromList heights

        n =
            Array.length arr
    in
    trapHelp arr 0 (n - 1) 0 0 0


trapHelp : Array Int -> Int -> Int -> Int -> Int -> Int -> Int
trapHelp arr left right leftMax rightMax water =
    if left >= right then
        water

    else
        let
            leftVal =
                Maybe.withDefault 0 (Array.get left arr)

            rightVal =
                Maybe.withDefault 0 (Array.get right arr)
        in
        if leftVal < rightVal then
            let
                newLeftMax =
                    max leftMax leftVal
            in
            trapHelp arr (left + 1) right newLeftMax rightMax (water + newLeftMax - leftVal)

        else
            let
                newRightMax =
                    max rightMax rightVal
            in
            trapHelp arr left (right - 1) leftMax newRightMax (water + newRightMax - rightVal)
