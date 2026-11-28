module AutomorphicNumbers exposing (automorphicNumbers, isAutomorphic)


isAutomorphic : Int -> Bool
isAutomorphic n =
    String.endsWith (String.fromInt n) (String.fromInt (n * n))


automorphicNumbers : Int -> List Int
automorphicNumbers limit =
    List.filter isAutomorphic (List.range 0 limit)



-- automorphicNumbers 999 == [0,1,5,6,25,76,376,625]
