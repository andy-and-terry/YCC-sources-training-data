import Data.List (unfoldr)

collatz :: Int -> [Int]
collatz = takeWhile (/= 1) . iterate step
  where
    step n
      | even n = n `div` 2
      | otherwise = 3 * n + 1

digitsRev :: Int -> [Int]
digitsRev = unfoldr (\n -> if n == 0 then Nothing else Just (n `mod` 10, n `div` 10))

fibs :: [Integer]
fibs = unfoldr (\(a, b) -> Just (a, (b, a + b))) (0, 1)

chunksOf :: Int -> [a] -> [[a]]
chunksOf n = unfoldr (\xs -> if null xs then Nothing else Just (splitAt n xs))

toBase :: Int -> Int -> [Int]
toBase b = reverse . unfoldr (\n -> if n == 0 then Nothing else Just (n `mod` b, n `div` b))

main :: IO ()
main = do
  print (collatz 27 !! 10, length (collatz 27))
  print (reverse (digitsRev 90210))
  print (take 15 fibs)
  print (chunksOf 3 [1 .. 10 :: Int])
  print (toBase 2 37, toBase 16 255)
  print (takeWhile (< 100) (iterate (* 2) 1))
  print (take 5 (cycle [1, 2, 3 :: Int]))
