module Main where

-- n(n+1)(n+2)/6
term :: Int -> Int
term n = ((n * (n + 1)) * (n + 2)) `div` 6

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " -> " ++ show (term n))) [1 .. 15]
