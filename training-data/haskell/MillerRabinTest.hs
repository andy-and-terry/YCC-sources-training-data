-- Deterministic Miller-Rabin primality test. Testing against these 12
-- witnesses is a well-known deterministic check for every n < 3.3*10^24,
-- which covers ordinary 64-bit integers with no randomness needed.
witnesses :: [Integer]
witnesses = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]

powMod :: Integer -> Integer -> Integer -> Integer
powMod _ 0 _ = 1
powMod b e m
  | even e = half * half `mod` m
  | otherwise = (b `mod` m) * (half * half `mod` m) `mod` m
  where
    half = powMod b (e `div` 2) m

-- Write n - 1 as 2^r * d with d odd.
factorOutTwos :: Integer -> (Integer, Integer)
factorOutTwos = go 0
  where
    go r d
      | odd d = (r, d)
      | otherwise = go (r + 1) (d `div` 2)

-- One Miller-Rabin round for witness a: true means "n is probably prime as
-- far as this witness can tell", false means "n is definitely composite".
millerTest :: Integer -> Integer -> Integer -> Integer -> Bool
millerTest n r d a
  | x == 1 || x == n - 1 = True
  | otherwise = loop (r - 1) x
  where
    x = powMod a d n
    loop 0 _ = False
    loop k y
      | y' == n - 1 = True
      | otherwise = loop (k - 1) y'
      where
        y' = (y * y) `mod` n

isProbablePrime :: Integer -> Bool
isProbablePrime n
  | n < 2 = False
  | n == 2 || n == 3 = True
  | even n = False
  | otherwise = all (millerTest n r d) (filter (< n) witnesses)
  where
    (r, d) = factorOutTwos (n - 1)

main :: IO ()
main = do
  print (filter isProbablePrime [1 .. 50])
  print (isProbablePrime 97)
  print (isProbablePrime 561) -- a Carmichael number: composite, but fools Fermat's test
  print (isProbablePrime 1000000007)
