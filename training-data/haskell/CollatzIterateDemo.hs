collatzStep :: Int -> Int
collatzStep n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

collatzSequence :: Int -> [Int]
collatzSequence = takeWhile (/= 1) . iterate collatzStep

collatzLength :: Int -> Int
collatzLength n = length (collatzSequence n) + 1

longestUnder :: Int -> (Int, Int)
longestUnder limit = maximum [(collatzLength n, n) | n <- [1 .. limit - 1]]

main :: IO ()
main = do
  print (collatzSequence 6 ++ [1])
  print (collatzLength 27)
  print (longestUnder 1000)
  print (take 8 (iterate (* 2) 1))
  print (takeWhile (< 40) (map (^ (2 :: Int)) [1 ..]))
  print (until (> 1000) (* 2) 1)
  print (takeWhile (/= 0) (iterate (`div` 10) 12345))
  print (cycle [1, 2, 3 :: Int] !! 100)
  print (replicate 3 'x', concat (replicate 2 "ab"))
