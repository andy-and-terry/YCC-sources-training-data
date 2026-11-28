module PronicNumbers exposing (isPronic, pronic)


pronic : Int -> List Int
pronic count =
    List.map (\n -> n * (n + 1)) (List.range 0 (count - 1))


isPronic : Int -> Bool
isPronic x =
    let
        n =
            floor (sqrt (toFloat x))
    in
    n * (n + 1) == x



-- pronic 10 == [0,2,6,12,20,30,42,56,72,90]
-- isPronic 56 == True, isPronic 57 == False
