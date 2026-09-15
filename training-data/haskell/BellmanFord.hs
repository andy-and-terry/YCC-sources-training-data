import qualified Data.Map as Map
import Data.Map (Map)

type Edge = (Int, Int, Int)

inf :: Int
inf = maxBound `div` 2

bellmanFord :: Int -> [Edge] -> Int -> Map Int Int
bellmanFord numNodes edges source = relaxAll (numNodes - 1) initial
  where
    initial = Map.insert source 0 (Map.fromList [(n, inf) | n <- [0 .. numNodes - 1]])
    relaxAll 0 dist = dist
    relaxAll n dist = relaxAll (n - 1) (foldl relax dist edges)
    relax dist (u, v, w) =
      let du = Map.findWithDefault inf u dist
          dv = Map.findWithDefault inf v dist
      in if du /= inf && du + w < dv then Map.insert v (du + w) dist else dist

main :: IO ()
main = do
  let edges = [(0, 1, 4), (0, 2, 5), (1, 2, -3), (2, 3, 4), (3, 1, -6)]
  print (Map.toList (bellmanFord 4 edges 0))
