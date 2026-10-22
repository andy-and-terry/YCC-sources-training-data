properDivisorSum :: Int -> Int
properDivisorSum n = sum [d | d <- [1 .. n `div` 2], n `mod` d == 0]

aliquot :: Int -> [Int]
aliquot 0 = [0]
aliquot n = n : aliquot (properDivisorSum n)

main :: IO ()
main = putStrLn (unwords (map show (aliquot 12)))
