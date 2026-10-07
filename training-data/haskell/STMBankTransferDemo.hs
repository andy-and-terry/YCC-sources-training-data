import Control.Concurrent
import Control.Concurrent.STM
import Control.Monad

type Account = TVar Int

transfer :: Account -> Account -> Int -> STM Bool
transfer from to amount = do
  balance <- readTVar from
  if balance < amount
    then return False
    else do
      modifyTVar' from (subtract amount)
      modifyTVar' to (+ amount)
      return True

waitForFunds :: Account -> Int -> STM ()
waitForFunds acc needed = do
  b <- readTVar acc
  when (b < needed) retry

main :: IO ()
main = do
  a <- newTVarIO 100
  b <- newTVarIO 50
  done <- newEmptyMVar

  ok1 <- atomically (transfer a b 30)
  ok2 <- atomically (transfer a b 500)
  print (ok1, ok2)

  forM_ [1 .. 10 :: Int] $ \_ -> forkIO $ do
    _ <- atomically (transfer b a 1)
    putMVar done ()
  replicateM_ 10 (takeMVar done)

  _ <- forkIO $ do
    atomically (waitForFunds b 1000)
    putStrLn "never printed"
  threadDelay 1000

  balances <- atomically ((,) <$> readTVar a <*> readTVar b)
  print balances
  print (uncurry (+) balances)
