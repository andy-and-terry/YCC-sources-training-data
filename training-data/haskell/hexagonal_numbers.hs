-- Hexagonal numbers: n(2n-1).
main :: IO ()
main = putStrLn (unwords [show (n * (2 * n - 1)) | n <- [1 .. 10 :: Int]])
