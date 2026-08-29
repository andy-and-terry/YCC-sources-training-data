import Data.Array

knapsack :: [(Int, Int)] -> Int -> Int
knapsack items capacity = table ! (length items, capacity)
  where
    n = length items
    itemArr = listArray (1, n) items
    table = array ((0, 0), (n, capacity))
      [((i, w), cell i w) | i <- [0 .. n], w <- [0 .. capacity]]
    cell 0 _ = 0
    cell i w =
      let (wt, val) = itemArr ! i
      in if wt > w
         then table ! (i - 1, w)
         else max (table ! (i - 1, w)) (val + table ! (i - 1, w - wt))

main :: IO ()
main = print (knapsack [(2, 3), (3, 4), (4, 5), (5, 6)] 5)
