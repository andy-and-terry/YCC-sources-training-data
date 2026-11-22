-- Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = putStrLn . unwords . map show $ [p | p <- [2 .. 99], isPrime p, isPrime (p + 2)]
