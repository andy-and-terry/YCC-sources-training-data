-- Deficient numbers below 100; expect 76.
properSum :: Int -> Int
properSum n = sum [d | d <- [1 .. n - 1], n `mod` d == 0]

main :: IO ()
main = print (length [n | n <- [1 .. 99], properSum n < n])
