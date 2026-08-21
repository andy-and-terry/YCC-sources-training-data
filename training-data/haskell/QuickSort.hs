quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (pivot:rest) = quicksort smaller ++ [pivot] ++ quicksort larger
  where
    smaller = [x | x <- rest, x < pivot]
    larger  = [x | x <- rest, x >= pivot]

main :: IO ()
main = print (quicksort [5, 3, 8, 1, 9, 2 :: Int])
