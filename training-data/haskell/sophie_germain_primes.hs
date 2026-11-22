-- Sophie Germain primes: p prime and 2p + 1 prime.
isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = putStrLn . unwords . map show $ [p | p <- [2 .. 99], isPrime p, isPrime (2 * p + 1)]
