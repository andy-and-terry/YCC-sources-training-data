runningTotals :: [Int] -> [Int]
runningTotals = scanl (+) 0

runningMax :: [Int] -> [Int]
runningMax (x : xs) = scanl max x xs
runningMax [] = []

factorialsUpTo :: Int -> [Int]
factorialsUpTo n = scanl (*) 1 [1 .. n]

main :: IO ()
main = do
  print (runningTotals [1, 2, 3, 4, 5])
  print (scanr (+) 0 [1, 2, 3, 4, 5])
  print (runningMax [3, 1, 4, 1, 5, 9, 2, 6])
  print (factorialsUpTo 6)
