import Control.Concurrent
import Control.Concurrent.STM
import Control.Monad (forM_, replicateM_)

transfer :: TVar Int -> TVar Int -> Int -> STM Bool
transfer from to amount = do
  balance <- readTVar from
  if balance < amount
    then return False
    else do
      modifyTVar' from (subtract amount)
      modifyTVar' to (+ amount)
      return True

main :: IO ()
main = do
  a <- newTVarIO 100
  b <- newTVarIO 0
  done <- newEmptyMVar
  forM_ [1 .. 4 :: Int] $ \_ -> forkIO $ do
    replicateM_ 10 (atomically (transfer a b 5))
    putMVar done ()
  replicateM_ 4 (takeMVar done)
  (,) <$> readTVarIO a <*> readTVarIO b >>= print
