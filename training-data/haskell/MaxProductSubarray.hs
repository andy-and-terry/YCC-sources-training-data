maxProduct :: [Int] -> Int
maxProduct [] = error "empty list"
maxProduct (x : xs) = best
  where
    (best, _, _) = foldl step (x, x, x) xs
    step (b, hi, lo) y =
      let cands = [y, hi * y, lo * y]
          hi' = maximum cands
       in (max b hi', hi', minimum cands)

main :: IO ()
main = print (map maxProduct [[2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4]])
