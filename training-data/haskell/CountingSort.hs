import Data.Array

countingSort :: [Int] -> [Int]
countingSort [] = []
countingSort xs = concatMap (\v -> replicate (counts ! v) v) [0 .. maxVal]
  where
    maxVal = maximum xs
    counts = accumArray (+) 0 (0, maxVal) [(x, 1) | x <- xs]

main :: IO ()
main = print (countingSort [4, 2, 2, 8, 3, 3, 1])
