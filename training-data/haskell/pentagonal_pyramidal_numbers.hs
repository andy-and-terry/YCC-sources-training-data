module Main where

-- n^2(n+1)/2
term :: Int -> Int
term n = ((n * n) * (n + 1)) `div` 2

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " -> " ++ show (term n))) [1 .. 15]
