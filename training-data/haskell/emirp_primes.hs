isPrime :: Int -> Bool
isPrime n = n >= 2 && all ((/= 0) . mod n) (takeWhile (\i -> i * i <= n) [2 ..])

rev :: Int -> Int
rev = read . reverse . show

emirps :: Int -> [Int]
emirps limit = [p | p <- [2 .. limit - 1], isPrime p, rev p /= p, isPrime (rev p)]

main :: IO ()
main = print (emirps 100)
