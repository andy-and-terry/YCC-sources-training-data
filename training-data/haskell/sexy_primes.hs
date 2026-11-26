-- Sexy primes below 100; expect 16 pairs.
isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = print (length [p | p <- [2 .. 99], isPrime p, isPrime (p + 6)])
