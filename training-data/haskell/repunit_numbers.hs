-- Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
main :: IO ()
main = putStrLn . unwords . map show . take 8 $ iterate (\r -> r * 10 + 1) (1 :: Integer)
