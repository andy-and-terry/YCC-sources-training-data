import qualified Data.Map as Map
import qualified Data.Set as Set

bfs :: Map.Map Int [Int] -> Int -> [Int]
bfs graph start = go (Set.singleton start) [start]
  where
    go _ [] = []
    go visited (x : xs) =
      let neighbors = Map.findWithDefault [] x graph
          new = filter (`Set.notMember` visited) neighbors
          visited' = foldr Set.insert visited new
      in x : go visited' (xs ++ new)

main :: IO ()
main = do
  let graph = Map.fromList [(0, [1, 2]), (1, [0, 3]), (2, [0, 3]), (3, [1, 2, 4]), (4, [3])]
  print (bfs graph 0)
