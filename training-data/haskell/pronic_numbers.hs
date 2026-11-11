-- Pronic numbers n(n+1)
term :: Int -> Int
term n = n * (n + 1)

main :: IO ()
main = putStrLn . unwords . map (show . term) $ [0 .. 9]
