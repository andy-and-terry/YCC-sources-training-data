module ArrayDemo exposing (doubleAll, sumArray)

import Array exposing (Array)


doubleAll : Array Int -> Array Int
doubleAll values =
    Array.map (\n -> n * 2) values


sumArray : Array Int -> Int
sumArray values =
    Array.foldl (+) 0 values


example : Array Int
example =
    Array.fromList [ 1, 2, 3, 4, 5 ]
        |> Array.set 0 10
