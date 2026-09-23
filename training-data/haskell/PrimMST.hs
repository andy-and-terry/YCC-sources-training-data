import Data.List (minimumBy)
import Data.Ord (comparing)
import qualified Data.Map as Map
import Data.Map (Map)

type Edge = (Int, Int, Int)

-- Prim's algorithm: grow a minimum spanning tree one cheapest crossing
-- edge at a time, starting from vertex 0.
prim :: Int -> [Edge] -> [Edge]
prim n edges = go (Map.fromList [(0, True)]) []
  where
    adjacency = Map.fromListWith (++)
      (concat [[(u, [(v, w)]), (v, [(u, w)])] | (u, v, w) <- edges])

    go visited mst
      | Map.size visited == n = reverse mst
      | otherwise =
          case candidates of
            [] -> reverse mst
            _ ->
              let (u, v, w) = minimumBy (comparing (\(_, _, wt) -> wt)) candidates
              in go (Map.insert v True visited) ((u, v, w) : mst)
      where
        candidates =
          [ (u, v, w)
          | u <- Map.keys visited
          , (v, w) <- Map.findWithDefault [] u adjacency
          , not (Map.member v visited)
          ]

main :: IO ()
main = do
  let edges = [(0, 1, 4), (0, 2, 3), (1, 2, 1), (1, 3, 2), (2, 3, 4), (3, 4, 2)]
  let mst = prim 5 edges
  print mst
  print (sum [w | (_, _, w) <- mst])
