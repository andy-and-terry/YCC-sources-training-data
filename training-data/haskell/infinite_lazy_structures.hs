fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

hamming :: [Integer]
hamming = 1 : merge3 (map (* 2) hamming) (map (* 3) hamming) (map (* 5) hamming)
  where
    merge3 a b c = merge a (merge b c)
    merge xx@(x : xs) yy@(y : ys)
      | x < y = x : merge xs yy
      | x > y = y : merge xx ys
      | otherwise = x : merge xs ys

main :: IO ()
main = do
  print (take 15 fibs, fibs !! 100)
  print (take 15 hamming)
  print (take 5 (cycle [1, 2]), take 3 (repeat 'z'))
  let triangle = scanl1 (+) [1 ..]
  print (takeWhile (< 50) triangle)
