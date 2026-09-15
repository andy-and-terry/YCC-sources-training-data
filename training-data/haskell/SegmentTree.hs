import Data.Array
import qualified Data.Map as Map

buildAssoc :: Array Int Int -> Int -> Int -> Int -> (Int, Map.Map Int Int)
buildAssoc arr node lo hi
  | lo == hi = (arr ! lo, Map.singleton node (arr ! lo))
  | otherwise =
      let mid = (lo + hi) `div` 2
          (leftVal, leftMap) = buildAssoc arr (2 * node) lo mid
          (rightVal, rightMap) = buildAssoc arr (2 * node + 1) (mid + 1) hi
          total = leftVal + rightVal
      in (total, Map.insert node total (Map.union leftMap rightMap))

buildTree :: [Int] -> Array Int Int
buildTree xs = listArray (1, 4 * n) [Map.findWithDefault 0 i nodeMap | i <- [1 .. 4 * n]]
  where
    n = length xs
    arr = listArray (1, n) xs
    (_, nodeMap) = buildAssoc arr 1 1 n

query :: Array Int Int -> Int -> Int -> Int -> Int -> Int -> Int
query tree node lo hi l r
  | r < lo || hi < l = 0
  | l <= lo && hi <= r = tree ! node
  | otherwise =
      let mid = (lo + hi) `div` 2
      in query tree (2 * node) lo mid l r + query tree (2 * node + 1) (mid + 1) hi l r

main :: IO ()
main = do
  let xs = [1, 3, 5, 7, 9, 11]
      n = length xs
      tree = buildTree xs
  print (query tree 1 1 n 2 4)
  print (query tree 1 1 n 1 6)
