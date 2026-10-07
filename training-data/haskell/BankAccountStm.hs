import Control.Concurrent (forkIO)
import Control.Concurrent.MVar
import Control.Concurrent.STM
import Control.Monad (forM_, replicateM_)

newtype Account = Account (TVar Int)

deposit :: Account -> Int -> STM ()
deposit (Account t) n = modifyTVar' t (+ n)

withdraw :: Account -> Int -> STM Bool
withdraw (Account t) n = do
  bal <- readTVar t
  if n > bal
    then pure False
    else writeTVar t (bal - n) >> pure True

transfer :: Account -> Account -> Int -> STM Bool
transfer from to n = do
  ok <- withdraw from n
  if ok then deposit to n >> pure True else pure False

main :: IO ()
main = do
  a <- Account <$> newTVarIO 0
  b <- Account <$> newTVarIO 0
  done <- newEmptyMVar
  forM_ [1 .. 8 :: Int] $ \_ -> forkIO $ do
    replicateM_ 1000 (atomically (deposit a 1))
    putMVar done ()
  replicateM_ 8 (takeMVar done)
  ok <- atomically (transfer a b 500)
  failed <- atomically (transfer b a 10000)
  let Account ta = a; Account tb = b
  balances <- (,) <$> readTVarIO ta <*> readTVarIO tb
  print (ok, failed, balances)
