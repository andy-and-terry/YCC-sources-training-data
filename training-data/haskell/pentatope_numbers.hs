module Main where

-- n(n+1)(n+2)(n+3)/24
term :: Int -> Int
term n = (((n * (n + 1)) * (n + 2)) * (n + 3)) `div` 24

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " -> " ++ show (term n))) [1 .. 15]
