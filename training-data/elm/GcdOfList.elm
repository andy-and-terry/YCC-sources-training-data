module GcdOfList exposing (gcd, gcdAll)


gcd : Int -> Int -> Int
gcd a b =
    if b == 0 then
        abs a

    else
        gcd b (modBy b a)


gcdAll : List Int -> Int
gcdAll =
    List.foldl gcd 0
