-- Circular primes below 100; expect 13.
isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

rotations :: Int -> [Int]
rotations n = [read (drop i s ++ take i s) | i <- [0 .. length s - 1]]
  where s = show n

main :: IO ()
main = print (length [n | n <- [2 .. 99], all isPrime (rotations n)])
