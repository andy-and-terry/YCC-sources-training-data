-- Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
import Data.Char (digitToInt)

isKeith :: Int -> Bool
isKeith n = go (map digitToInt (show n))
  where
    k = length (show n)
    go seq'
      | last seq' >= n = last seq' == n
      | otherwise = go (seq' ++ [sum (drop (length seq' - k) seq')])

main :: IO ()
main = putStrLn (unwords (map show (filter isKeith [10 .. 1199])))
