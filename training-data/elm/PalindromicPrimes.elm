module PalindromicPrimes exposing (palindromicPrimes)


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


isPalindrome : Int -> Bool
isPalindrome n =
    let
        s =
            String.fromInt n
    in
    s == String.reverse s


palindromicPrimes : Int -> List Int
palindromicPrimes limit =
    List.filter (\n -> isPalindrome n && isPrime n) (List.range 2 limit)



-- palindromicPrimes 199 == [2,3,5,7,11,101,131,151,181,191]
