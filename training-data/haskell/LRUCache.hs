import Data.IORef
import qualified Data.Map as Map
import Data.Map (Map)

data LRU = LRU { capacity :: Int, store :: Map Int Int, order :: [Int] }

newLRU :: Int -> IO (IORef LRU)
newLRU cap = newIORef (LRU cap Map.empty [])

touch :: Int -> [Int] -> [Int]
touch k xs = k : filter (/= k) xs

get :: IORef LRU -> Int -> IO (Maybe Int)
get ref k = do
  lru <- readIORef ref
  case Map.lookup k (store lru) of
    Nothing -> return Nothing
    Just v -> do
      writeIORef ref lru { order = touch k (order lru) }
      return (Just v)

put :: IORef LRU -> Int -> Int -> IO ()
put ref k v = do
  lru <- readIORef ref
  let newStore = Map.insert k v (store lru)
      newOrder = touch k (order lru)
  if Map.size newStore > capacity lru
    then do
      let evict = last newOrder
      writeIORef ref lru { store = Map.delete evict newStore, order = init newOrder }
    else writeIORef ref lru { store = newStore, order = newOrder }

main :: IO ()
main = do
  ref <- newLRU 2
  put ref 1 1
  put ref 2 2
  v1 <- get ref 1
  put ref 3 3
  v2 <- get ref 2
  print (v1, v2)
