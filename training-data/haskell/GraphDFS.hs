import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.Map (Map)

type Graph = Map Int [Int]

dfs :: Graph -> Int -> [Int]
dfs graph start = reverse (go [start] Set.empty [])
  where
    go [] _ acc = acc
    go (n : ns) visited acc
      | Set.member n visited = go ns visited acc
      | otherwise =
          let neighbors = Map.findWithDefault [] n graph
          in go (neighbors ++ ns) (Set.insert n visited) (n : acc)

main :: IO ()
main = do
  let g = Map.fromList [(0, [1, 2]), (1, [0, 3]), (2, [0, 3]), (3, [1, 2, 4]), (4, [3])]
  print (dfs g 0)
  print (dfs g 4)
