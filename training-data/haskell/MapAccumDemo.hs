import Data.List (mapAccumL, mapAccumR, unfoldr)

main :: IO ()
main = do
  print (mapAccumL (\acc x -> (acc + x, acc * x)) 0 [1 .. 5])
  print (mapAccumR (\acc x -> (acc + x, acc * x)) 0 [1 .. 5])
  print (unfoldr (\n -> if n > 60 then Nothing else Just (n, n * 2)) 1)
  print (scanl1 max [3, 1, 4, 1, 5, 9, 2, 6 :: Int])
  print (iterate (`div` 2) 100 !! 3)
  print (takeWhile (> 0) (iterate (`div` 2) 100))
