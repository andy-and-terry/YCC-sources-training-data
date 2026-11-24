module MobiusFunction exposing (mobius)

-- Moebius function: 0 if n has a squared prime factor, else (-1)^k.
-- List.map mobius (List.range 1 30) == [1,-1,-1,0,-1,1,-1,0,0,1,-1,0,-1,1,1,0,-1,0,-1,0,1,1,-1,0,0,1,0,0,-1,-1]


mobius : Int -> Int
mobius n =
    go n 2 1


go : Int -> Int -> Int -> Int
go m p acc =
    if p * p > m then
        if m > 1 then -acc else acc

    else if remainderBy p m == 0 then
        let
            m2 =
                m // p
        in
        if remainderBy p m2 == 0 then
            0

        else
            go m2 (p + 1) (-acc)

    else
        go m (p + 1) acc
