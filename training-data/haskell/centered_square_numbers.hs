-- Centered square numbers 2n(n+1)+1
term :: Int -> Int
term n = ((2 * n) * (n + 1)) + 1

main :: IO ()
main = putStrLn . unwords . map (show . term) $ [0 .. 9]
