module FermatPrimality exposing (probablyPrime)

{-| Fermat primality test; Carmichael number 561 fools it. -}


powMod : Int -> Int -> Int -> Int
powMod b e m =
    if e == 0 then
        modBy m 1

    else
        let
            half =
                powMod b (e // 2) m

            sq =
                modBy m (half * half)
        in
        if modBy 2 e == 0 then
            sq

        else
            modBy m (sq * b)


probablyPrime : Int -> Bool
probablyPrime n =
    n > 2 && powMod 2 (n - 1) n == 1
