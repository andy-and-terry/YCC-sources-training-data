lucky :: Int -> [Int]
lucky limit = go [1, 3 .. limit] 1
  where
    go nums i
      | i >= length nums || step > length nums = nums
      | otherwise = go [v | (idx, v) <- zip [1 ..] nums, idx `mod` step /= 0] (i + 1)
      where
        step = nums !! i

main :: IO ()
main = putStrLn (unwords (map show (lucky 50)))
