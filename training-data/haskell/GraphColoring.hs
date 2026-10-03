import qualified Data.Map as Map
import Data.Map (Map)
import Data.List (find)

type Graph = Map Int [Int]

-- Greedily colors each vertex, in order, with the first of `k` colors
-- that doesn't clash with an already-colored neighbor. This is a fixed-
-- order greedy coloring (no backtracking), so it can report failure on
-- a graph that a smarter search would still color with k colors.
colorGraph :: Graph -> Int -> Maybe (Map Int Int)
colorGraph graph k = go (Map.keys graph) Map.empty
  where
    go [] coloring = Just coloring
    go (v : vs) coloring =
      case find valid [0 .. k - 1] of
        Nothing -> Nothing
        Just c -> go vs (Map.insert v c coloring)
      where
        valid c = all (\n -> Map.lookup n coloring /= Just c) (Map.findWithDefault [] v graph)

main :: IO ()
main = do
  let graph = Map.fromList [(0, [1, 2]), (1, [0, 2]), (2, [0, 1, 3]), (3, [2])]
  print (colorGraph graph 3)
  print (colorGraph graph 2)
