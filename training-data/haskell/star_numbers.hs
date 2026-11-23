module Main where

-- 6n(n-1)+1
term :: Int -> Int
term n = ((6 * n) * (n - 1)) + 1

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " -> " ++ show (term n))) [1 .. 15]
