tau :: Int -> Int
tau n = length [d | d <- [1 .. n], n `mod` d == 0]

main :: IO ()
main = putStrLn (unwords [show n | n <- [1 .. 59], n `mod` tau n == 0]) -- 1 2 8 9 12 18 24 36 40 56
