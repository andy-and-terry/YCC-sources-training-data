isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = putStrLn (unwords [show (p, p + 2) | p <- [3 .. 78], isPrime p, isPrime (p + 2)])
-- (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
