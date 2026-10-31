module Main where

import Data.List (group)

primeFactors :: Int -> [Int]
primeFactors = go 2
  where
    go p n
      | n == 1 = []
      | p * p > n = [n]
      | n `mod` p == 0 = p : go p (n `div` p)
      | otherwise = go (p + 1) n

isPowerful :: Int -> Bool
isPowerful n = all ((>= 2) . length) (group (primeFactors n))

main :: IO ()
main = putStrLn (unwords (map show (filter isPowerful [1 .. 100])))
