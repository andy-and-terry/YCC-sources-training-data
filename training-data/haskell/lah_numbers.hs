-- Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fact :: Integer -> Integer
fact n = product [1 .. n]

comb :: Integer -> Integer -> Integer
comb n k = fact n `div` (fact k * fact (n - k))

main :: IO ()
main = putStrLn . unwords . map show $
  [comb (n - 1) (k - 1) * fact n `div` fact k | let n = 5, k <- [1 .. n]]
