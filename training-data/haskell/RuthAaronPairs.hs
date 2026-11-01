-- Sum of prime factors counted with multiplicity.
sopfr :: Int -> Int
sopfr = go 2 0
  where
    go p acc n
      | n == 1 = acc
      | p * p > n = acc + n
      | n `mod` p == 0 = go p (acc + p) (n `div` p)
      | otherwise = go (p + 1) acc n

main :: IO ()
main = putStrLn . unwords . map show $ [n | n <- [2 .. 109], sopfr n == sopfr (n + 1)]
