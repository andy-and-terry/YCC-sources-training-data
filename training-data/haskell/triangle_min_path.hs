minimumTotal :: [[Int]] -> Int
minimumTotal t = head (foldr1 step t)
  where
    step row below = zipWith3 (\v l r -> v + min l r) row below (tail below)

main :: IO ()
main = print (minimumTotal [[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]) -- 11
