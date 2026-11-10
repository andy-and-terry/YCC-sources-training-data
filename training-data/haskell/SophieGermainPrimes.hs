isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

sophieGermain :: [Int]
sophieGermain = [p | p <- [2 ..], isPrime p, isPrime (2 * p + 1)]

main :: IO ()
main = putStrLn (unwords (map show (take 10 sophieGermain))) -- 2 3 5 11 23 29 41 53 83 89
