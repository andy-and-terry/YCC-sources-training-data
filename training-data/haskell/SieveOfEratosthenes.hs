sieve :: [Int] -> [Int]
sieve [] = []
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primesUpTo :: Int -> [Int]
primesUpTo n = sieve [2 .. n]

main :: IO ()
main = print (primesUpTo 50)
