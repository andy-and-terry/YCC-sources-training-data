module Main where

import Data.Char (digitToInt, intToDigit)

isSelfDescribing :: Int -> Bool
isSelfDescribing n = and (zipWith check [0 ..] s)
  where
    s = show n
    check i d = length (filter (== intToDigit i) s) == digitToInt d

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " " ++ show (isSelfDescribing n))) [1210, 2020, 21200, 1211]
