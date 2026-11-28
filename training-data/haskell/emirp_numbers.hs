isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

rev :: Int -> Int
rev = read . reverse . show

emirps :: [Int]
emirps = [p | p <- [2 .. 199], rev p /= p, isPrime p, isPrime (rev p)]

main :: IO ()
main = print emirps -- [13,17,31,37,71,73,79,97,107,113,149,157,167,179,199]
