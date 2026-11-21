-- Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
powMod :: Int -> Int -> Int -> Int
powMod _ 0 _ = 1
powMod b e m
  | even e = half * half `mod` m
  | otherwise = b * powMod b (e - 1) m `mod` m
  where half = powMod b (e `div` 2) m

isPrime :: Int -> Bool
isPrime n = n > 1 && all (\p -> n `mod` p /= 0) (takeWhile (\p -> p * p <= n) [2 ..])

isCarmichael :: Int -> Bool
isCarmichael n = not (isPrime n) && all ok [2 .. n - 1]
  where ok a = gcd a n /= 1 || powMod a (n - 1) n == 1

main :: IO ()
main = putStrLn (unwords (map show (filter isCarmichael [3, 5 .. 2999])))
