powMod :: Integer -> Integer -> Integer -> Integer
powMod _ 0 _ = 1
powMod base expo m
  | even expo = half * half `mod` m
  | otherwise = base * (half * half `mod` m) `mod` m
  where half = powMod base (expo `div` 2) m

-- Deterministic for n < 3,317,044,064,679,887,385,961,981 using this witness set.
isPrimeMR :: Integer -> Bool
isPrimeMR n
  | n < 2 = False
  | n == 2 || n == 3 = True
  | even n = False
  | otherwise = all (witnessPasses n d r) witnesses
  where
    (d, r) = factorOutTwos (n - 1) 0
    factorOutTwos m k
      | even m = factorOutTwos (m `div` 2) (k + 1)
      | otherwise = (m, k)
    witnesses = filter (< n) [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]

witnessPasses :: Integer -> Integer -> Int -> Integer -> Bool
witnessPasses n d r a = go (powMod a d n) 0
  where
    go x i
      | x == 1 || x == n - 1 = True
      | i == r - 1 = False
      | otherwise = go (x * x `mod` n) (i + 1)

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ ": " ++ show (isPrimeMR n)))
             [2, 17, 561, 997, 1000000007, 104729, 100]
