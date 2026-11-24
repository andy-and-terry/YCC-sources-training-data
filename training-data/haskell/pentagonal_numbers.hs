-- Pentagonal numbers: n(3n-1)/2.
main :: IO ()
main = putStrLn (unwords [show (n * (3 * n - 1) `div` 2) | n <- [1 .. 10 :: Int]])
