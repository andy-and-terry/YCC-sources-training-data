-- Tetrahedral numbers n(n+1)(n+2)/6
term :: Int -> Int
term n = ((n * (n + 1)) * (n + 2)) `div` 6

main :: IO ()
main = putStrLn . unwords . map (show . term) $ [0 .. 9]
