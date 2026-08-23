module SieveOfEratosthenes exposing (primes)

import Set exposing (Set)


primes : Int -> List Int
primes limit =
    sieve (Set.fromList (List.range 2 limit)) 2 limit
        |> Set.toList


sieve : Set Int -> Int -> Int -> Set Int
sieve candidates n limit =
    if n * n > limit then
        candidates

    else if Set.member n candidates then
        sieve (removeMultiples candidates (n * n) n limit) (n + 1) limit

    else
        sieve candidates (n + 1) limit


removeMultiples : Set Int -> Int -> Int -> Int -> Set Int
removeMultiples candidates current step limit =
    if current > limit then
        candidates

    else
        removeMultiples (Set.remove current candidates) (current + step) step limit
