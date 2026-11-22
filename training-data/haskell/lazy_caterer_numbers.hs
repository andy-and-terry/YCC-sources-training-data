-- Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
main :: IO ()
main = putStrLn . unwords . map show $ [n * (n + 1) `div` 2 + 1 | n <- [0 .. 9 :: Int]]
