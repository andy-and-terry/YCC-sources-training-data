import qualified Data.Map as Map
import Data.Map (Map)
import Data.List (foldl')

type Graph = Map Int [(Int, Int)]

infinity :: Int
infinity = maxBound `div` 2

dijkstra :: Graph -> Int -> Map Int Int
dijkstra graph source = go initial (Map.keys graph)
  where
    initial = Map.fromList [(n, if n == source then 0 else infinity) | n <- Map.keys graph]
    go dist [] = dist
    go dist unvisited =
      let u = pickMin dist unvisited
          du = dist Map.! u
          rest = filter (/= u) unvisited
          neighbors = Map.findWithDefault [] u graph
          dist' = foldl' (relax u du) dist neighbors
      in go dist' rest
    pickMin dist = foldl1 (\a b -> if dist Map.! a <= dist Map.! b then a else b)
    relax _ du dist (v, w) =
      let newDist = du + w
      in if newDist < Map.findWithDefault infinity v dist
         then Map.insert v newDist dist
         else dist

main :: IO ()
main = do
  let g = Map.fromList [(0, [(1, 1), (2, 4)]), (1, [(2, 2), (3, 5)]), (2, [(3, 1)]), (3, [])]
  print (Map.toList (dijkstra g 0))
