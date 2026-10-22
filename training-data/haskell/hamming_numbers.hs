-- Hamming numbers (5-smooth): only prime factors 2, 3 and 5
isHamming :: Int -> Bool
isHamming n = strip 5 (strip 3 (strip 2 n)) == 1
  where
    strip p m
      | m `mod` p == 0 = strip p (m `div` p)
      | otherwise = m

main :: IO ()
main = putStrLn (unwords (map show (take 20 (filter isHamming [1 ..]))))
