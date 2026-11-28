primes :: [Int]
primes = sieve [2 ..] where sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

main :: IO ()
main = do
  print (take 10 primes)
  print (zipWith3 (\a b c -> a + b * c) [1, 2, 3] [4, 5, 6] [7, 8, 9])
