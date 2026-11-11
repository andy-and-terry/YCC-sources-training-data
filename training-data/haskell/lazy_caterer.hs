-- Lazy caterer sequence: max pieces from n cuts
term :: Int -> Int
term n = ((n * (n + 1)) `div` 2) + 1

main :: IO ()
main = putStrLn . unwords . map (show . term) $ [0 .. 9]
