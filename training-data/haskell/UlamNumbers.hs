ulam :: Int -> [Int]
ulam count = go [1, 2] 3
  where
    go seq n
      | length seq >= count = seq
      | ways == 1 = go (seq ++ [n]) (n + 1)
      | otherwise = go seq (n + 1)
      where
        ways = length [a | a <- seq, let b = n - a, b > a, b `elem` seq]

main :: IO ()
main = putStrLn (unwords (map show (ulam 15)))
