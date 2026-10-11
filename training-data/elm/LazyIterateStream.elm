module LazyIterateStream exposing (iterate, powersOfTwo)


iterate : Int -> (a -> a) -> a -> List a
iterate n step seed =
    if n <= 0 then
        []

    else
        seed :: iterate (n - 1) step (step seed)


powersOfTwo : Int -> List Int
powersOfTwo n =
    iterate n ((*) 2) 1
