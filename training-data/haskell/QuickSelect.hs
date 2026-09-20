-- Functional quickselect: finds the k-th smallest element (0-indexed)
-- without fully sorting, using the same three-way list partition idiom as
-- QuickSort.hs.
quickSelect :: (Ord a) => [a] -> Int -> a
quickSelect [] _ = error "quickSelect: empty list"
quickSelect (pivot : rest) k
  | k < numSmaller = quickSelect smaller k
  | k < numSmaller + numEqual = pivot
  | otherwise = quickSelect larger (k - numSmaller - numEqual)
  where
    smaller = [x | x <- rest, x < pivot]
    equalRest = [x | x <- rest, x == pivot]
    larger = [x | x <- rest, x > pivot]
    numSmaller = length smaller
    numEqual = 1 + length equalRest

main :: IO ()
main = do
  let nums = [7, 10, 4, 3, 20, 15 :: Int]
  print (quickSelect nums 0)
  print (quickSelect nums 2)
  print (map (quickSelect nums) [0 .. 5])
