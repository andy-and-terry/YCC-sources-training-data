module Main where

primeFactors :: Int -> [Int]
primeFactors = go 2
  where
    go p n
      | n == 1 = []
      | p * p > n = [n]
      | n `mod` p == 0 = p : go p (n `div` p)
      | otherwise = go (p + 1) n

main :: IO ()
main = print [n | n <- [2 .. 29], length (primeFactors n) == 2]
