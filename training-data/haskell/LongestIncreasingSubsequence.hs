import Data.Array

lisLength :: [Int] -> Int
lisLength [] = 0
lisLength xs = maximum (elems table)
  where
    n = length xs
    arr = listArray (0, n - 1) xs
    table = array (0, n - 1) [(i, best i) | i <- [0 .. n - 1]]
    best i =
      1 + maximum (0 : [table ! j | j <- [0 .. i - 1], arr ! j < arr ! i])

main :: IO ()
main = print (lisLength [10, 9, 2, 5, 3, 7, 101, 18])
