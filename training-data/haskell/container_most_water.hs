maxArea :: [Int] -> Int
maxArea hs = go 0 (length hs - 1) 0
  where
    go lo hi best
      | lo >= hi = best
      | otherwise =
          let a = min (hs !! lo) (hs !! hi) * (hi - lo)
              best' = max best a
          in if hs !! lo < hs !! hi then go (lo + 1) hi best' else go lo (hi - 1) best'

main :: IO ()
main = print (maxArea [1, 8, 6, 2, 5, 4, 8, 3, 7]) -- 49
