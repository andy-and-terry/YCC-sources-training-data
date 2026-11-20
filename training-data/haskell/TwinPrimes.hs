-- Twin primes below 50.
isPrime :: Int -> Bool
isPrime n = n > 1 && all ((/= 0) . mod n) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = print [(p, p + 2) | p <- [2 .. 50], isPrime p, isPrime (p + 2)]
