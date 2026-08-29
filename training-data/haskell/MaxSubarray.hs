maxSubarray :: [Int] -> Int
maxSubarray (x:xs) = snd (foldl step (x, x) xs)
  where
    step (cur, best) y = let cur' = max y (cur + y) in (cur', max best cur')
maxSubarray [] = 0

main :: IO ()
main = print (maxSubarray [-2, 1, -3, 4, -1, 2, 1, -5, 4])
