module PolygonalNumbers exposing (hexagonal, pentagonal, polygonal, triangular)


polygonal : Int -> Int -> Int
polygonal s n =
    ((s - 2) * n * n - (s - 4) * n) // 2


firstTen : Int -> List Int
firstTen s =
    List.map (polygonal s) (List.range 1 10)


triangular : List Int
triangular =
    firstTen 3


pentagonal : List Int
pentagonal =
    firstTen 5


hexagonal : List Int
hexagonal =
    firstTen 6



-- triangular == [1,3,6,10,15,21,28,36,45,55]
-- pentagonal == [1,5,12,22,35,51,70,92,117,145]
-- hexagonal  == [1,6,15,28,45,66,91,120,153,190]
