import Data.List (tails)

ulam :: Int -> [Int]
ulam count = go [1, 2] 3
  where
    go acc candidate
      | length acc >= count = acc
      | ways acc candidate == 1 = go (acc ++ [candidate]) (candidate + 1)
      | otherwise = go acc (candidate + 1)
    ways acc candidate =
      length [() | (x : ys) <- tails acc, y <- ys, x + y == candidate]

main :: IO ()
main = putStrLn (unwords (map show (ulam 15)))
