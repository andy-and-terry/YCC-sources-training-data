module FoldDirectionDemo exposing (digitsToInt, reverseWithFoldl, subtractLeft, subtractRight)


subtractLeft : List Int -> Int
subtractLeft =
    List.foldl (\x acc -> acc - x) 0


subtractRight : List Int -> Int
subtractRight =
    List.foldr (\x acc -> x - acc) 0


reverseWithFoldl : List a -> List a
reverseWithFoldl =
    List.foldl (::) []


digitsToInt : List Int -> Int
digitsToInt =
    List.foldl (\d acc -> acc * 10 + d) 0


-- subtractLeft [ 1, 2, 3 ] == -6
-- subtractRight [ 1, 2, 3 ] == 2
-- reverseWithFoldl [ 1, 2, 3 ] == [ 3, 2, 1 ]
-- digitsToInt [ 4, 2, 0 ] == 420
