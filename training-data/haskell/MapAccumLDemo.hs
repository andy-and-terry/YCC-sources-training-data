import Data.List (mapAccumR)
import Data.Traversable (mapAccumL)

-- running total alongside each element
runningTotals :: [Int] -> (Int, [Int])
runningTotals = mapAccumL (\acc x -> (acc + x, acc + x)) 0

-- label each item with a fresh index
labelItems :: [String] -> (Int, [(Int, String)])
labelItems = mapAccumL (\n s -> (n + 1, (n, s))) 1

-- normalise by a final sum, threaded right to left
suffixSums :: [Int] -> (Int, [Int])
suffixSums = mapAccumR (\acc x -> (acc + x, acc)) 0

main :: IO ()
main = do
  print (runningTotals [1, 2, 3, 4, 5])
  print (labelItems ["a", "b", "c"])
  print (suffixSums [1, 2, 3, 4])
  print (scanl (+) 0 [1, 2, 3, 4])
  print (scanl1 max [3, 1, 4, 1, 5, 9, 2, 6])
  print (scanr (+) 0 [1, 2, 3])
  print (snd (mapAccumL (\seen x -> (x : seen, length (filter (== x) seen))) [] "abracadabra"))
