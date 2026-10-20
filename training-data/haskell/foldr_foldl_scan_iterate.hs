import Data.List (foldl')

main :: IO ()
main = do
  print (foldr (\x acc -> x : take 2 acc) [] [1 .. 10])
  print (foldl' (+) 0 [1 .. 100000 :: Int])
  print (scanl (+) 0 [1 .. 5], scanr (+) 0 [1 .. 3], scanl1 max [3, 1, 4, 1, 5])
  print (take 8 (iterate (* 2) 1), takeWhile (< 40) (map (^ 2) [1 ..]))
  print (until (> 1000) (* 3) 1)
  print (zipWith3 (\a b c -> a + b * c) [1, 2] [3, 4] [5, 6], unzip [(1, 'a'), (2, 'b')])
  print (replicate 3 'x', concatMap show [1, 2, 3], and [], or [])
