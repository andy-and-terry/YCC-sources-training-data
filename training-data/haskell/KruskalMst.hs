import Data.IORef
import qualified Data.Map as Map
import Data.Map (Map)
import Data.List (sortOn)

type DSU = IORef (Map Int Int)

newDSU :: Int -> IO DSU
newDSU n = newIORef (Map.fromList [(i, i) | i <- [0 .. n - 1]])

find :: DSU -> Int -> IO Int
find ref x = do
  m <- readIORef ref
  let p = m Map.! x
  if p == x then return x else find ref p

union :: DSU -> Int -> Int -> IO Bool
union ref x y = do
  rx <- find ref x
  ry <- find ref y
  if rx == ry
    then return False
    else do
      modifyIORef ref (Map.insert rx ry)
      return True

kruskal :: Int -> [(Int, Int, Int)] -> IO [(Int, Int, Int)]
kruskal n edges = do
  dsu <- newDSU n
  let sorted = sortOn (\(_, _, w) -> w) edges
  results <- mapM (tryAdd dsu) sorted
  return [e | (e, ok) <- results, ok]
  where
    tryAdd dsu edge@(a, b, _) = do
      ok <- union dsu a b
      return (edge, ok)

main :: IO ()
main = do
  let edges = [(0, 1, 1), (0, 2, 3), (1, 2, 4), (1, 3, 2), (2, 3, 5)]
  mst <- kruskal 4 edges
  mapM_ print mst
