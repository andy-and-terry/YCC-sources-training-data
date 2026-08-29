import Data.IORef
import qualified Data.Map as Map
import Data.Map (Map)

type DSU = IORef (Map Int Int)

newDSU :: Int -> IO DSU
newDSU n = newIORef (Map.fromList [(i, i) | i <- [0 .. n - 1]])

find :: DSU -> Int -> IO Int
find ref x = do
  m <- readIORef ref
  let p = m Map.! x
  if p == x then return x else find ref p

union :: DSU -> Int -> Int -> IO ()
union ref x y = do
  rx <- find ref x
  ry <- find ref y
  if rx == ry
    then return ()
    else modifyIORef ref (Map.insert rx ry)

main :: IO ()
main = do
  dsu <- newDSU 5
  union dsu 0 1
  union dsu 1 2
  r1 <- find dsu 0
  r2 <- find dsu 2
  r3 <- find dsu 3
  print (r1 == r2, r1 == r3)
