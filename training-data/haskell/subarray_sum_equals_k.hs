-- Count contiguous subarrays whose sum equals k (prefix sums + Data.Map).
import qualified Data.Map.Strict as M

countSubarrays :: [Int] -> Int -> Int
countSubarrays nums k = snd (foldl step (M.singleton 0 1, 0) prefixes)
  where
    prefixes = scanl1 (+) nums
    step (seen, count) total =
      (M.insertWith (+) total 1 seen, count + M.findWithDefault 0 (total - k) seen)

main :: IO ()
main = print (countSubarrays [1, 1, 1] 2)
