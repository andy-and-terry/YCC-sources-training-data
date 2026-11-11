-- Amicable pairs: d(a) == b and d(b) == a with a /= b.
d :: Int -> Int
d n = sum [i | i <- [1 .. n - 1], n `mod` i == 0]

main :: IO ()
main = mapM_ print [(a, b) | a <- [2 .. 1499], let b = d a, b > a, d b == a]
