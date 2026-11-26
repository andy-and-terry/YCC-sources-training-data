-- Primorials up to 1e6, including 1; expect 8.
isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = do
  let primes = filter isPrime [2 ..]
      values = takeWhile (<= 1000000) (scanl (*) 1 primes)
  print (length values, values)
