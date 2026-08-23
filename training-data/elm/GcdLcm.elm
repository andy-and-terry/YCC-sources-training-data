module GcdLcm exposing (gcd, lcm)


gcd : Int -> Int -> Int
gcd a b =
    if b == 0 then
        abs a

    else
        gcd b (modBy b a)


lcm : Int -> Int -> Int
lcm a b =
    abs (a * b) // gcd a b
