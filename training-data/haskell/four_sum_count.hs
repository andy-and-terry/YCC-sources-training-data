import qualified Data.Map.Strict as M

fourSumCount :: [Int] -> [Int] -> [Int] -> [Int] -> Int
fourSumCount a b c d = sum [M.findWithDefault 0 (negate (x + y)) sums | x <- c, y <- d]
  where
    sums = M.fromListWith (+) [(x + y, 1 :: Int) | x <- a, y <- b]

main :: IO ()
main = print (fourSumCount [1, 2] [-2, -1] [-1, 2] [0, 2]) -- 2
