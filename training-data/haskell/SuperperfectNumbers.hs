sigma :: Int -> Int
sigma n = sum [d | d <- [1 .. n], n `mod` d == 0]

main :: IO ()
main = putStrLn (unwords [show n | n <- [1 .. 99], sigma (sigma n) == 2 * n]) -- 2 4 16 64
