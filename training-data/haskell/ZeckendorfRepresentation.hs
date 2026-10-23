fibs :: [Int]
fibs = 1 : 2 : zipWith (+) fibs (tail fibs)

zeckendorf :: Int -> [Int]
zeckendorf = go (reverse (takeWhile (<= 100) fibs))
  where
    go [] _ = []
    go (f : fs) n
      | f <= n = f : go fs (n - f)
      | otherwise = go fs n

main :: IO ()
main = putStrLn (unwords (map show (zeckendorf 100)))
