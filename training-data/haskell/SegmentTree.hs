import Data.Array

data SegmentTree = SegmentTree
  { size :: Int
  , tree :: Array Int Int
  }

buildTree :: [Int] -> SegmentTree
buildTree values = SegmentTree n (build (listArray (0, 2 * n - 1) (replicate (2 * n) 0)))
  where
    n = length values
    build arr0 = foldl combineUp withLeaves [n - 1, n - 2 .. 1]
      where
        withLeaves = arr0 // zip [n ..] values
        combineUp arr i = arr // [(i, arr ! (2 * i) + arr ! (2 * i + 1))]

rangeSum :: SegmentTree -> Int -> Int -> Int
rangeSum st l0 r0 = go (l0 + n) (r0 + n) 0
  where
    n = size st
    arr = tree st
    go l r acc
      | l >= r = acc
      | otherwise =
          let acc1 = if odd l then acc + arr ! l else acc
              l1 = if odd l then l + 1 else l
              acc2 = if odd r then acc1 + arr ! (r - 1) else acc1
              r1 = if odd r then r - 1 else r
          in go (l1 `div` 2) (r1 `div` 2) acc2

main :: IO ()
main = do
  let st = buildTree [1, 3, 5, 7, 9, 11]
  print (rangeSum st 1 4)
