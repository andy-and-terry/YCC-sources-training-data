import Data.List (sortBy)
import Data.Ord (comparing)
import qualified Data.Map as Map
import Data.Map (Map)

type Edge = (Int, Int, Int)

find :: Map Int Int -> Int -> Int
find parent x
  | Map.findWithDefault x x parent == x = x
  | otherwise = find parent (parent Map.! x)

union :: Map Int Int -> Int -> Int -> Map Int Int
union parent x y = Map.insert (find parent x) (find parent y) parent

kruskal :: Int -> [Edge] -> [Edge]
kruskal n edges = go initial (sortBy (comparing (\(_, _, w) -> w)) edges) []
  where
    initial = Map.fromList [(i, i) | i <- [0 .. n - 1]]
    go _ [] acc = reverse acc
    go parent ((u, v, w) : rest) acc
      | find parent u == find parent v = go parent rest acc
      | otherwise = go (union parent u v) rest ((u, v, w) : acc)

main :: IO ()
main = do
  let edges = [(0, 1, 4), (0, 2, 1), (2, 1, 2), (1, 3, 5), (2, 3, 8)]
  print (kruskal 4 edges)
  print (sum [w | (_, _, w) <- kruskal 4 edges])
