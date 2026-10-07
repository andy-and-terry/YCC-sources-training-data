import Data.List (maximumBy)
import Data.Ord (comparing)

collatz :: Int -> [Int]
collatz 1 = [1]
collatz n
  | even n = n : collatz (n `div` 2)
  | otherwise = n : collatz (3 * n + 1)

main :: IO ()
main = do
  print (collatz 6)
  print (length (collatz 27))
  let best = maximumBy (comparing (length . collatz)) [1 .. 1000]
  print (best, length (collatz best))
