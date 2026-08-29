insertionSort :: Ord a => [a] -> [a]
insertionSort = foldr insert []
  where
    insert x [] = [x]
    insert x (y:ys)
      | x <= y = x : y : ys
      | otherwise = y : insert x ys

main :: IO ()
main = print (insertionSort [5, 3, 8, 1, 9, 2])
