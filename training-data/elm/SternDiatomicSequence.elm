module SternDiatomicSequence exposing (stern)


stern : Int -> Int
stern n =
    if n < 2 then
        n

    else if modBy 2 n == 0 then
        stern (n // 2)

    else
        stern (n // 2) + stern (n // 2 + 1)



-- List.map stern (List.range 0 19) == [0,1,1,2,1,3,2,3,1,4,3,5,2,5,3,4,1,5,4,7]
