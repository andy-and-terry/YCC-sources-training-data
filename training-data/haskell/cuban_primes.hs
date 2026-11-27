isPrime :: Int -> Bool
isPrime n = n >= 2 && all ((/= 0) . mod n) (takeWhile (\i -> i * i <= n) [2 ..])

cubanPrimes :: [Int]
cubanPrimes = filter isPrime [3 * y * y + 3 * y + 1 | y <- [1 ..]]

main :: IO ()
main = print (take 8 cubanPrimes)
