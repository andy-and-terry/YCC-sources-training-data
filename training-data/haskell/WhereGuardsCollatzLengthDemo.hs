import Data.List (maximumBy)
import Data.Ord (comparing)

collatzLen :: Int -> Int
collatzLen = go 1
  where
    go acc 1 = acc
    go acc n
      | even n = go (acc + 1) (n `div` 2)
      | otherwise = go (acc + 1) (3 * n + 1)

bmi :: Double -> Double -> String
bmi w h
  | v < under = "under"
  | v < normal = "normal"
  | otherwise = "over"
  where
    v = w / h ^ (2 :: Int)
    (under, normal) = (18.5, 25.0)

main :: IO ()
main = do
  print (maximumBy (comparing collatzLen) [1 .. 1000])
  putStrLn (bmi 70 1.75)
  putStrLn (bmi 50 1.80)
