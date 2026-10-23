golomb :: [Int]
golomb = 1 : map f [2 ..]
  where
    f n = 1 + golomb !! (n - 1 - golomb !! (golomb !! (n - 2) - 1))

main :: IO ()
main = putStrLn (unwords (map show (take 20 golomb)))
