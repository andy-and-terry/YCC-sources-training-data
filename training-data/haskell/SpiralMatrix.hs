import Data.List (transpose)

spiral :: [[a]] -> [a]
spiral [] = []
spiral (row : rest) = row ++ spiral (reverse (transpose rest))

main :: IO ()
main = do
  print (spiral [[1, 2, 3], [4, 5, 6], [7, 8, 9 :: Int]])
  print (spiral [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12 :: Int]])
