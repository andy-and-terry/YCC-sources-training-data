digitSum :: Int -> Int
digitSum 0 = 0
digitSum n = n `mod` 10 + digitSum (n `div` 10)

primeFactors :: Int -> [Int]
primeFactors = go 2
  where
    go p n
      | n < 2 = []
      | p * p > n = [n]
      | n `mod` p == 0 = p : go p (n `div` p)
      | otherwise = go (p + 1) n

isSmith :: Int -> Bool
isSmith n = length fs > 1 && sum (map digitSum fs) == digitSum n
  where
    fs = primeFactors n

main :: IO ()
main = putStrLn (unwords (map show (filter isSmith [2 .. 99])))
