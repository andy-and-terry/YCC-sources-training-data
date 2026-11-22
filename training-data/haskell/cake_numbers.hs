-- Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
main :: IO ()
main = putStrLn . unwords . map show $ [(n ^ 3 + 5 * n + 6) `div` 6 | n <- [0 .. 9 :: Int]]
