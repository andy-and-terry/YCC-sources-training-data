module PowerFunction exposing (power)


power : Int -> Int -> Int
power base exp =
    if exp == 0 then
        1

    else if modBy 2 exp == 0 then
        let
            half =
                power base (exp // 2)
        in
        half * half

    else
        base * power base (exp - 1)
