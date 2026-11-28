isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

goldbach :: Int -> [(Int, Int)]
goldbach n = [(p, n - p) | p <- [2 .. n `div` 2], isPrime p, isPrime (n - p)]

main :: IO ()
main = print (goldbach 28)
