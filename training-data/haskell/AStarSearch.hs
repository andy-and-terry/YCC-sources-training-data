import qualified Data.Map as Map
import Data.Map (Map)
import Data.List (minimumBy)
import Data.Ord (comparing)

type Graph = Map String [(String, Int)]

astar :: Graph -> (String -> Int) -> String -> String -> Maybe Int
astar graph heuristic start goal = go (Map.singleton start 0) [start]
  where
    go gScores [] = Nothing
    go gScores frontier
      | current == goal = Map.lookup current gScores
      | otherwise = go gScores' frontier'
      where
        current = minimumBy (comparing (\n -> Map.findWithDefault maxBound n gScores + heuristic n)) frontier
        currentG = Map.findWithDefault maxBound current gScores
        neighbors = Map.findWithDefault [] current graph
        rest = filter (/= current) frontier

        (gScores', frontier') = foldl relax (gScores, rest) neighbors
        relax (gs, fr) (nbr, weight) =
          let tentative = currentG + weight
          in if tentative < Map.findWithDefault maxBound nbr gs
               then (Map.insert nbr tentative gs, nbr : filter (/= nbr) fr)
               else (gs, fr)

main :: IO ()
main = do
  let graph =
        Map.fromList
          [ ("a", [("b", 1), ("c", 4)])
          , ("b", [("c", 2), ("d", 5)])
          , ("c", [("d", 1)])
          , ("d", [])
          ]
      heuristic n = if n == "d" then 0 else 1
  print (astar graph heuristic "a" "d")
