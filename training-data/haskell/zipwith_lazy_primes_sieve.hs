primes :: [Int]
primes = sieve [2 ..]
  where sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

main :: IO ()
main = do
  print (take 10 primes)
  print (takeWhile (< 40) (zipWith (+) primes (tail primes)))
