-- Amicable pairs below 1500 via sums of proper divisors.
s :: Int -> Int
s n = sum [d | d <- [1 .. n - 1], n `mod` d == 0]

main :: IO ()
main = mapM_ (\(a, b) -> putStrLn (show a ++ " " ++ show b))
  [(a, s a) | a <- [2 .. 1499], s a > a, s (s a) == a]
