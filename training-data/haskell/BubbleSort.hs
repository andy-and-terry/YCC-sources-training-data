bubbleSort :: [Int] -> [Int]
bubbleSort xs = if sorted == xs then xs else bubbleSort sorted
  where
    sorted = onePass xs
    onePass (a:b:rest)
      | a > b = b : onePass (a : rest)
      | otherwise = a : onePass (b : rest)
    onePass xs' = xs'

main :: IO ()
main = print (bubbleSort [5, 2, 9, 1, 5, 6])
