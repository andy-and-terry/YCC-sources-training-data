module Main where

import Data.Char (digitToInt)

persistence :: Integer -> Int
persistence n
  | n < 10 = 0
  | otherwise = 1 + persistence (product (map (toInteger . digitToInt) (show n)))

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " " ++ show (persistence n))) [39, 77, 999, 10]
