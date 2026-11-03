countPrimesBelow :: Int -> Int
countPrimesBelow n = length (sieve [2 .. n - 1])
  where
    sieve [] = []
    sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

main :: IO ()
main = print (countPrimesBelow 100)
