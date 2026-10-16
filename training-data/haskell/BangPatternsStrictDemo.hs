{-# LANGUAGE BangPatterns #-}

import Data.List (foldl')

mean :: [Double] -> Double
mean = go 0 0
  where
    go !s !n [] = if n == 0 then 0 else s / fromIntegral (n :: Int)
    go !s !n (x:xs) = go (s + x) (n + 1) xs

sumStrict :: [Int] -> Int
sumStrict = foldl' (+) 0

data P = P !Int !Int deriving Show

step :: P -> Int -> P
step (P a b) x = P (a + x) (b + 1)

main :: IO ()
main = do
  print (mean [1 .. 100000])
  print (sumStrict [1 .. 1000000])
  print (foldl' step (P 0 0) [1 .. 10])
