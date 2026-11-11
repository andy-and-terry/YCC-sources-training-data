-- Fermat primality test; Carmichael number 561 fools it.
powMod :: Integer -> Integer -> Integer -> Integer
powMod _ 0 m = 1 `mod` m
powMod b e m
  | even e = half * half `mod` m
  | otherwise = b * powMod b (e - 1) m `mod` m
  where half = powMod b (e `div` 2) m

probablyPrime :: Integer -> Bool
probablyPrime n = n > 2 && powMod 2 (n - 1) n == 1

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " " ++ show (probablyPrime n))) [97, 91, 561]
