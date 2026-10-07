module CollatzSequence exposing (collatz)


collatz : Int -> List Int
collatz start =
    let
        go n acc =
            if n == 1 then
                List.reverse (1 :: acc)

            else if modBy 2 n == 0 then
                go (n // 2) (n :: acc)

            else
                go (3 * n + 1) (n :: acc)
    in
    if start < 1 then
        []

    else
        go start []
