-- Aliquot sequence: replace n by the sum of its proper divisors.
aliquotSum :: Int -> Int
aliquotSum n = sum [d | d <- [1 .. n `div` 2], n `mod` d == 0]

aliquot :: Int -> [Int]
aliquot n = take 20 (go n)
  where
    go 1 = [1]
    go m = m : go (aliquotSum m)

main :: IO ()
main = putStrLn (unwords (map show (aliquot 12)))
