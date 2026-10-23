-- Best sum ending here vs. best overall, carried through a left fold.
maxSubarray :: [Int] -> Int
maxSubarray [] = error "empty list"
maxSubarray (x : xs) = snd (foldl step (x, x) xs)
  where
    step (cur, best) y =
      let cur' = max y (cur + y)
       in (cur', max best cur')

main :: IO ()
main = do
  print (maxSubarray [-2, 1, -3, 4, -1, 2, 1, -5, 4])
  print (maxSubarray [-3, -1, -2])
