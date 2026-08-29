import qualified Data.Map as Map
import qualified Data.Set as Set

type Graph = Map.Map String [String]

topSort :: Graph -> [String]
topSort g = reverse (fst (foldl visit ([], Set.empty) (Map.keys g)))
  where
    visit (order, visited) node
      | Set.member node visited = (order, visited)
      | otherwise =
          let visited' = Set.insert node visited
              deps = Map.findWithDefault [] node g
              (order', visited'') = foldl visit (order, visited') deps
          in (node : order', visited'')

main :: IO ()
main = do
  let g = Map.fromList [("a", ["b", "c"]), ("b", ["d"]), ("c", ["d"]), ("d", [])]
  print (topSort g)
