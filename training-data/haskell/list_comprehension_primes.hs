primes :: [Int]
primes = sieve [2 ..] where sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

pythag :: Int -> [(Int, Int, Int)]
pythag n = [(a, b, c) | c <- [1 .. n], b <- [1 .. c], a <- [1 .. b], a * a + b * b == c * c]

main :: IO ()
main = do
  print (take 10 primes)
  print (pythag 20)
  print [(x, y) | x <- [1 .. 3], y <- "ab"]
  print [if even x then "e" else "o" | x <- [1 .. 4 :: Int]]
