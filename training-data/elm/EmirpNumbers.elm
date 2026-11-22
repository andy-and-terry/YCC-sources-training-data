module EmirpNumbers exposing (isEmirp, emirps)

-- Emirps: primes whose digit reversal is a different prime.
-- emirps == [ 13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199 ]


isPrime : Int -> Bool
isPrime n =
    let
        go d =
            if d * d > n then
                True

            else if modBy d n == 0 then
                False

            else
                go (d + 1)
    in
    n >= 2 && go 2


reverseNum : Int -> Int
reverseNum n =
    String.fromInt n |> String.reverse |> String.toInt |> Maybe.withDefault 0


isEmirp : Int -> Bool
isEmirp n =
    let
        r =
            reverseNum n
    in
    r /= n && isPrime n && isPrime r


emirps : List Int
emirps =
    List.range 2 199 |> List.filter isEmirp
