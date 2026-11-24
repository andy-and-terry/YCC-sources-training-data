-- Centered square numbers: n^2 + (n+1)^2.
main :: IO ()
main = putStrLn (unwords [show (n * n + (n + 1) * (n + 1)) | n <- [0 .. 9 :: Int]])
