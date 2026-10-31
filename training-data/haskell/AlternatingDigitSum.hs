module Main where

import Data.Char (digitToInt)

alternatingDigitSum :: Int -> Int
alternatingDigitSum n = sum (zipWith (*) (cycle [1, -1]) (map digitToInt (reverse (show n))))

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " " ++ show (alternatingDigitSum n))) [1234, 99999, 1000]
