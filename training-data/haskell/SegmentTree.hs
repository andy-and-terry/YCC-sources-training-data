import Data.Array

data SegTree = SegTree { segArr :: Array Int Int, segN :: Int }

build :: [Int] -> SegTree
build values = SegTree (go initial 1 0 (n - 1)) n
  where
    n = length values
    valueArr = listArray (0, n - 1) values
    initial = listArray (1, 4 * max n 1) (repeat 0)
    go arr node start end
      | start == end = arr // [(node, valueArr ! start)]
      | otherwise =
          let mid = (start + end) `div` 2
              arr1 = go arr (node * 2) start mid
              arr2 = go arr1 (node * 2 + 1) (mid + 1) end
          in arr2 // [(node, arr2 ! (node * 2) + arr2 ! (node * 2 + 1))]

query :: SegTree -> Int -> Int -> Int -> Int -> Int -> Int
query tree node start end l r
  | r < start || end < l = 0
  | l <= start && end <= r = segArr tree ! node
  | otherwise =
      let mid = (start + end) `div` 2
      in query tree (node * 2) start mid l r + query tree (node * 2 + 1) (mid + 1) end l r

rangeSum :: SegTree -> Int -> Int -> Int
rangeSum tree l r = query tree 1 0 (segN tree - 1) l r

main :: IO ()
main = do
  let tree = build [1, 3, 5, 7, 9, 11]
  print (rangeSum tree 1 3)
