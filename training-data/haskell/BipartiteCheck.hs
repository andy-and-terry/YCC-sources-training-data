import qualified Data.Map as Map
import Data.Map (Map)

type Graph = Map Int [Int]

isBipartite :: Graph -> Bool
isBipartite g = go (Map.keys g) Map.empty
  where
    go [] _ = True
    go (n : ns) colors
      | Map.member n colors = go ns colors
      | otherwise = case bfs [n] (Map.insert n 0 colors) of
          Nothing -> False
          Just colors' -> go ns colors'

    -- Processes one frontier layer at a time, only enqueueing nodes that
    -- are newly colored during this layer, so each node is expanded once.
    bfs [] colors = Just colors
    bfs frontier colors =
      case foldl visitNode (colors, [], True) frontier of
        (_, _, False) -> Nothing
        (colors', nextFrontier, True) -> bfs nextFrontier colors'
      where
        visitNode acc@(_, _, False) _ = acc
        visitNode (cs, nf, True) node =
          foldl (visitNeighbor (cs Map.! node)) (cs, nf, True) (Map.findWithDefault [] node g)

        visitNeighbor _ acc@(_, _, False) _ = acc
        visitNeighbor myColor (cs, nf, True) next =
          case Map.lookup next cs of
            Just c -> (cs, nf, c /= myColor)
            Nothing -> (Map.insert next (1 - myColor) cs, next : nf, True)

main :: IO ()
main = do
  let bipartite = Map.fromList [(0, [1, 3]), (1, [0, 2]), (2, [1, 3]), (3, [0, 2])]
      notBipartite = Map.fromList [(0, [1, 2]), (1, [0, 2]), (2, [0, 1])]
  print (isBipartite bipartite)
  print (isBipartite notBipartite)
