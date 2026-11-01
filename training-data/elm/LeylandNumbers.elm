module LeylandNumbers exposing (leyland, values)

{-| Leyland numbers: x^y + y^x for x >= y >= 2.
-}


leyland : Int -> Int -> Int
leyland x y =
    x ^ y + y ^ x


values : List Int
values =
    List.concatMap
        (\x -> List.map (\y -> leyland x y) (List.range 2 x))
        (List.range 2 4)



-- values == [ 8, 17, 54, 32, 145, 512 ]
