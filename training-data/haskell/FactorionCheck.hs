module Main where

import Data.Char (digitToInt)

factorial :: Int -> Int
factorial k = product [1 .. k]

isFactorion :: Int -> Bool
isFactorion n = n == sum (map (factorial . digitToInt) (show n))

main :: IO ()
main = print (filter isFactorion [1 .. 49999])
