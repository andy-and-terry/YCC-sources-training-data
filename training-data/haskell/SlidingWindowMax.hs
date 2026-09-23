maxWindowSum :: Int -> [Int] -> Int
maxWindowSum k xs
  | length xs < k = 0
  | otherwise = go firstSum rest firstSum
  where
    (window, rest) = splitAt k xs
    firstSum = sum window

    go _ [] best = best
    go currentSum (n : ns) best =
      let dropped = xs !! (length xs - length ns - k - 1)
          currentSum' = currentSum + n - dropped
      in go currentSum' ns (max best currentSum')

slidingWindowMaxima :: Int -> [Int] -> [Int]
slidingWindowMaxima k xs
  | length xs < k = []
  | otherwise = map maximum (windows k xs)
  where
    windows n ys
      | length ys < n = []
      | otherwise = take n ys : windows n (tail ys)

main :: IO ()
main = do
  print (maxWindowSum 3 [2, 1, 5, 1, 3, 2])
  print (slidingWindowMaxima 3 [1, 3, -1, -3, 5, 3, 6, 7])
