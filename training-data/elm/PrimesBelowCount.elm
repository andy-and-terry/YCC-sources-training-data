module PrimesBelowCount exposing (countPrimesBelow)


countPrimesBelow : Int -> Int
countPrimesBelow n =
    List.range 2 (n - 1)
        |> sieve
        |> List.length


sieve : List Int -> List Int
sieve xs =
    case xs of
        [] ->
            []

        p :: rest ->
            p :: sieve (List.filter (\x -> modBy p x /= 0) rest)
