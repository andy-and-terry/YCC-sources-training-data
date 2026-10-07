primes :: [Int]
primes = sieve [2 ..]
  where
    sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
    sieve [] = []

triangulars :: [Int]
triangulars = scanl1 (+) [1 ..]

hamming :: [Integer]
hamming = 1 : merge3 (map (* 2) hamming) (map (* 3) hamming) (map (* 5) hamming)
  where
    merge3 a b c = merge a (merge b c)
    merge xx@(x : xs) yy@(y : ys)
      | x < y = x : merge xs yy
      | x > y = y : merge xx ys
      | otherwise = x : merge xs ys
    merge xs [] = xs
    merge [] ys = ys

pascal :: [[Integer]]
pascal = iterate (\row -> zipWith (+) (0 : row) (row ++ [0])) [1]

main :: IO ()
main = do
  print (take 10 primes)
  print (takeWhile (< 50) triangulars)
  print (take 15 hamming)
  mapM_ print (take 5 pascal)
  print (head (dropWhile (< 1000) triangulars))
  print (zip "abc" [0 :: Int ..])
