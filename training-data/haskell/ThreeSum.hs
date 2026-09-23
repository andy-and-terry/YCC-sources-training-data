import Data.List (sort, nub)

threeSum :: [Int] -> Int -> [(Int, Int, Int)]
threeSum xs target = nub (concatMap findPairs [0 .. length sorted - 3])
  where
    sorted = sort xs

    findPairs i = go (i + 1) (length sorted - 1)
      where
        a = sorted !! i
        go lo hi
          | lo >= hi = []
          | s == target = (a, sorted !! lo, sorted !! hi) : go (lo + 1) (hi - 1)
          | s < target = go (lo + 1) hi
          | otherwise = go lo (hi - 1)
          where
            s = a + sorted !! lo + sorted !! hi

main :: IO ()
main = do
  print (threeSum [-1, 0, 1, 2, -1, -4] 0)
  print (threeSum [1, 2, 3, 4, 5] 9)
