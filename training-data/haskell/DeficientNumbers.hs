sigma :: Int -> Int
sigma n = sum [d | d <- [1 .. n], n `mod` d == 0]

main :: IO ()
main = print [n | n <- [1 .. 20], sigma n < 2 * n]
