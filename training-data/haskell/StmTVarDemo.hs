import Control.Concurrent
import Control.Concurrent.STM
import Control.Monad (forM_, replicateM)

-- STM composes atomic transactions over TVars; concurrent transfers
-- either both succeed or both retry, with no explicit locking.
transfer :: TVar Int -> TVar Int -> Int -> STM ()
transfer from to amount = do
  balance <- readTVar from
  if balance < amount
    then retry
    else do
      modifyTVar' from (subtract amount)
      modifyTVar' to (+ amount)

main :: IO ()
main = do
  accountA <- newTVarIO 100
  accountB <- newTVarIO 0

  done <- newEmptyMVar
  forM_ [1 .. 5 :: Int] $ \_ -> forkIO $ do
    atomically (transfer accountA accountB 10)
    putMVar done ()
  replicateM 5 (takeMVar done)

  finalA <- readTVarIO accountA
  finalB <- readTVarIO accountB
  putStrLn ("account A: " ++ show finalA)
  putStrLn ("account B: " ++ show finalB)
