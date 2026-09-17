import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.Map (Map)
import Data.Set (Set)

type Graph = Map String [String]

hasCycle :: Graph -> Bool
hasCycle g = any (\n -> visit n Set.empty Set.empty) (Map.keys g)
  where
    visit node visited inStack
      | Set.member node inStack = True
      | Set.member node visited = False
      | otherwise =
          let inStack' = Set.insert node inStack
              visited' = Set.insert node visited
          in any (\next -> visit next visited' inStack') (Map.findWithDefault [] node g)

main :: IO ()
main = do
  let acyclic = Map.fromList [("a", ["b"]), ("b", ["c"]), ("c", [])]
      cyclic = Map.fromList [("a", ["b"]), ("b", ["c"]), ("c", ["a"])]
  print (hasCycle acyclic)
  print (hasCycle cyclic)
