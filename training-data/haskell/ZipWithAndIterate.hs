fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

powersOfTwo :: [Integer]
powersOfTwo = iterate (* 2) 1

collatz :: Int -> [Int]
collatz = takeWhile (/= 1) . iterate step
  where
    step n
      | even n = n `div` 2
      | otherwise = 3 * n + 1

main :: IO ()
main = do
  print (take 12 fibs)
  print (take 8 powersOfTwo)
  print (collatz 6 ++ [1])
  print (zip3 [1 :: Int ..] "abc" [True, False, True])
  print (unzip [(1 :: Int, 'a'), (2, 'b')])
  print (zipWith3 (\a b c -> a + b * c) [1, 2, 3] [4, 5, 6] [7, 8, 9 :: Int])
  print (takeWhile (< 40) (map (^ 2) [1 :: Int ..]))
  print (span even [2, 4, 5, 6 :: Int])
