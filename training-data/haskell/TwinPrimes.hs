primesUpTo :: Int -> [Int]
primesUpTo n = sieve [2 .. n]
  where
    sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
    sieve [] = []

main :: IO ()
main = do
  let ps = primesUpTo 50
  print [(p, q) | (p, q) <- zip ps (tail ps), q - p == 2]
