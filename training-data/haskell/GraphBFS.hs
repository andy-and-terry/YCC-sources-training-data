import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.Map (Map)

type Graph = Map Int [Int]

bfs :: Graph -> Int -> [Int]
bfs graph start = go [start] (Set.singleton start)
  where
    go [] _ = []
    go (n : ns) visited =
      let neighbors = Map.findWithDefault [] n graph
          newNodes = filter (`Set.notMember` visited) neighbors
          visited' = foldr Set.insert visited newNodes
      in n : go (ns ++ newNodes) visited'

main :: IO ()
main = do
  let g = Map.fromList [(0, [1, 2]), (1, [0, 3]), (2, [0, 3]), (3, [1, 2, 4]), (4, [3])]
  print (bfs g 0)
  print (bfs g 4)
