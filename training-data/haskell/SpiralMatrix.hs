import Data.List (transpose)

-- Build a spiral by peeling: the first row, then spiral the rotated remainder.
spiral :: Int -> [[Int]]
spiral n = go 1 n n
  where
    go _ 0 _ = []
    go _ _ 0 = []
    go start rows cols =
      [start .. start + cols - 1]
        : rotateBack (go (start + cols) cols (rows - 1))
    rotateBack = map reverse . transpose

main :: IO ()
main = mapM_ (putStrLn . unwords . map show) (spiral 4)
