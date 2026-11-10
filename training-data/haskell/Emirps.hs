isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

emirps :: [Int]
emirps = [n | n <- [2 ..], let r = read (reverse (show n)), r /= n, isPrime n, isPrime r]

main :: IO ()
main = putStrLn (unwords (map show (take 10 emirps))) -- 13 17 31 37 71 73 79 97 107 113
