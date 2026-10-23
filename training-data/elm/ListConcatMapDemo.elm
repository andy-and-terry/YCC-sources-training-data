module ListConcatMapDemo exposing (pairs, withDoubles)


withDoubles : List Int -> List Int
withDoubles =
    List.concatMap (\x -> [ x, x * 2 ])


pairs : List a -> List b -> List ( a, b )
pairs xs ys =
    List.concatMap (\x -> List.map (\y -> ( x, y )) ys) xs



-- withDoubles [ 1, 2 ] == [ 1, 2, 2, 4 ]
-- pairs [ 1, 2 ] [ 'a', 'b' ] == [ ( 1, 'a' ), ( 1, 'b' ), ( 2, 'a' ), ( 2, 'b' ) ]
-- List.concat [ [ 1 ], [ 2, 3 ] ] == [ 1, 2, 3 ]
