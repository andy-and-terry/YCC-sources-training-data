mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = splitAt (length xs `div` 2) xs
    merge [] ys = ys
    merge xs' [] = xs'
    merge (x:xs') (y:ys)
      | x <= y = x : merge xs' (y : ys)
      | otherwise = y : merge (x : xs') ys

main :: IO ()
main = print (mergeSort [5, 2, 9, 1, 5, 6])
