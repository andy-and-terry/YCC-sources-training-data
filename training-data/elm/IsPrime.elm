module IsPrime exposing (isPrime)


isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False

    else
        not (List.any (\d -> modBy d n == 0) (List.range 2 (n - 1)))
