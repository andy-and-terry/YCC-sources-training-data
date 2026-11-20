module WilsonPrimeCheck exposing (wilson)

{-| Wilson's theorem primality test. -}


wilson : Int -> Bool
wilson n =
    n >= 2 && List.foldl (\i f -> modBy n (f * i)) 1 (List.range 2 (n - 1)) == n - 1
