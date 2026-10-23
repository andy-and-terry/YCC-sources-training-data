import Data.List (mapAccumL, mapAccumR)

-- mapAccumL threads an accumulator through a list while producing a new list.

runningTotal :: [Int] -> (Int, [Int])
runningTotal = mapAccumL (\acc x -> (acc + x, acc + x)) 0

-- Number each element, returning the next free label too
label :: Int -> [String] -> (Int, [(Int, String)])
label = mapAccumL (\n s -> (n + 1, (n, s)))

-- Normalize against the running maximum so far
runningMax :: [Int] -> [Int]
runningMax = snd . mapAccumL (\m x -> let m' = max m x in (m', m')) minBound

main :: IO ()
main = do
  print (runningTotal [1, 2, 3, 4, 5])
  print (label 10 ["a", "b", "c"])
  print (runningMax [3, 1, 4, 1, 5, 9, 2, 6])
  -- mapAccumR goes right to left
  print (mapAccumR (\acc x -> (acc + x, acc)) 0 [1, 2, 3, 4])
