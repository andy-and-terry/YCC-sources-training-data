module ZAlgorithm exposing (zArray)

import Array exposing (Array)


zArray : String -> List Int
zArray s =
    let
        chars =
            Array.fromList (String.toList s)

        n =
            Array.length chars
    in
    if n == 0 then
        []

    else
        buildZ chars n 1 0 0 (Array.repeat n 0) |> Array.toList


buildZ : Array Char -> Int -> Int -> Int -> Int -> Array Int -> Array Int
buildZ chars n i l r z =
    if i >= n then
        z

    else
        let
            initial =
                if i < r then
                    min (r - i) (Maybe.withDefault 0 (Array.get (i - l) z))

                else
                    0

            zi =
                expand chars n i initial

            ( newL, newR ) =
                if i + zi > r then
                    ( i, i + zi )

                else
                    ( l, r )
        in
        buildZ chars n (i + 1) newL newR (Array.set i zi z)


expand : Array Char -> Int -> Int -> Int -> Int
expand chars n i zi =
    let
        a =
            Array.get zi chars

        b =
            Array.get (i + zi) chars
    in
    if i + zi < n && a /= Nothing && a == b then
        expand chars n i (zi + 1)

    else
        zi
