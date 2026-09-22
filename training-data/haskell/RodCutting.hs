import Data.Array

rodCutting :: [Int] -> Int -> Int
rodCutting prices n = table ! n
  where
    priceArr = listArray (1, length prices) prices
    table = array (0, n) [(l, best l) | l <- [0 .. n]]
    best 0 = 0
    best l = maximum [priceArr ! cut + table ! (l - cut) | cut <- [1 .. l], cut <= length prices]

main :: IO ()
main = print (rodCutting [1, 5, 8, 9, 10, 17, 17, 20] 8)
