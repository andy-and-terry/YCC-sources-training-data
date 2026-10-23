luckyNumbers :: Int -> [Int]
luckyNumbers limit = sieve 1 [1, 3 .. limit - 1]
  where
    sieve i nums
      | i < len && step <= len =
          sieve (i + 1) [x | (idx, x) <- zip [1 ..] nums, idx `mod` step /= 0]
      | otherwise = nums
      where
        len = length nums
        step = nums !! i

main :: IO ()
main = putStrLn (unwords (map show (luckyNumbers 100)))
