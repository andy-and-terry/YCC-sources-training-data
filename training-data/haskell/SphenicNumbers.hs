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

isSphenic :: Int -> Bool
isSphenic n = map length (group (primeFactors n)) == [1, 1, 1]

main :: IO ()
main = print (filter isSphenic [2 .. 79])
