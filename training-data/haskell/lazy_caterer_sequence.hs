module Main where

-- n(n+1)/2+1
term :: Int -> Int
term n = ((n * (n + 1)) `div` 2) + 1

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " -> " ++ show (term n))) [1 .. 15]
