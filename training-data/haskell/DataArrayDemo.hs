import Data.Array

squares :: Array Int Int
squares = listArray (0, 9) [x * x | x <- [0 .. 9]]

fibArray :: Int -> Array Int Integer
fibArray n = arr
  where
    arr = listArray (0, n) [f i | i <- [0 .. n]]
    f 0 = 0
    f 1 = 1
    f i = arr ! (i - 1) + arr ! (i - 2)

main :: IO ()
main = do
  print (bounds squares)
  print (squares ! 5)
  print (elems squares)
  print (elems (fibArray 10))
  let updated = squares // [(0, 100), (1, 200)]
  print (elems updated)
