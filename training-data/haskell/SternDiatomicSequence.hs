stern :: [Int]
stern = map s [0 ..]
  where
    s 0 = 0
    s 1 = 1
    s n
      | even n = stern !! half
      | otherwise = stern !! half + stern !! (half + 1)
      where
        half = n `div` 2

main :: IO ()
main = putStrLn (unwords (map show (take 20 stern)))
