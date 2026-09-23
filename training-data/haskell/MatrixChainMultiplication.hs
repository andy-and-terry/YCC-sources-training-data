import Data.Array

-- Minimum scalar multiplications to multiply a chain of matrices, given
-- the array of dimensions (matrix i has dimensions dims[i] x dims[i+1]).
matrixChainOrder :: [Int] -> Int
matrixChainOrder dims = dp ! (1, n - 1)
  where
    n = length dims
    dimsArr = listArray (0, n - 1) dims
    dp = array ((1, 1), (n - 1, n - 1))
      [ ((i, j), cost i j) | i <- [1 .. n - 1], j <- [1 .. n - 1] ]

    cost i j
      | i == j = 0
      | otherwise = minimum
          [ dp ! (i, k) + dp ! (k + 1, j)
              + dimsArr ! (i - 1) * dimsArr ! k * dimsArr ! j
          | k <- [i .. j - 1]
          ]

main :: IO ()
main = do
  let dims = [40, 20, 30, 10, 30]
  print (matrixChainOrder dims)
