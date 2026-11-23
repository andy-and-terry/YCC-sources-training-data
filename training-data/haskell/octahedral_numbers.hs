module Main where

-- n(2n^2+1)/3
term :: Int -> Int
term n = (n * (((2 * n) * n) + 1)) `div` 3

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " -> " ++ show (term n))) [1 .. 15]
