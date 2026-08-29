selectionSort :: Ord a => [a] -> [a]
selectionSort [] = []
selectionSort xs = m : selectionSort (removeFirst m xs)
  where
    m = minimum xs
    removeFirst _ [] = []
    removeFirst y (z:zs)
      | y == z = zs
      | otherwise = z : removeFirst y zs

main :: IO ()
main = print (selectionSort [5, 3, 8, 1, 9, 2])
