-- Boyer-Moore voting algorithm: O(n) time, O(1) space.
majorityElement :: [Int] -> Int
majorityElement xs = go xs 0 0
  where
    go [] candidate _ = candidate
    go (x : rest) candidate count
      | count == 0 = go rest x 1
      | x == candidate = go rest candidate (count + 1)
      | otherwise = go rest candidate (count - 1)

main :: IO ()
main = do
  print (majorityElement [2, 2, 1, 1, 1, 2, 2])
  print (majorityElement [3, 3, 4, 2, 3, 3, 3])
