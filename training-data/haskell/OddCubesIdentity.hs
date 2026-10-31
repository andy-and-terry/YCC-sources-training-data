module Main where

cubeFromOdds :: Integer -> Integer
cubeFromOdds n = sum [start + 2 * i | i <- [0 .. n - 1]]
  where start = n * n - n + 1

main :: IO ()
main = mapM_ (\n -> putStrLn (unwords [show n, show (cubeFromOdds n), show (cubeFromOdds n == n ^ 3)])) [1 .. 5]
