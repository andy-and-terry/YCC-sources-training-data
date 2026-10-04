primes :: [Int]
primes = sieve [2 ..]
  where sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

collatz :: Int -> [Int]
collatz = takeWhile (/= 1) . iterate step
  where step n = if even n then n `div` 2 else 3 * n + 1

main :: IO ()
main = do
  print (take 10 primes)
  print (take 12 fibs)
  print (collatz 27 !! 10, length (collatz 27))
  print (take 5 (cycle [1, 2 :: Int]))
  print (take 4 (iterate (* 3) (1 :: Int)))
  print (takeWhile (< 40) (map (^ (2 :: Int)) [1 :: Int ..]))
  print (head (dropWhile (< 1000) fibs))
