import Control.Concurrent
import Control.Monad

main :: IO ()
main = do
  results <- newMVar []
  dones <- forM [1 .. 4 :: Int] $ \i -> do
    d <- newEmptyMVar
    _ <- forkIO $ do
      modifyMVar_ results (return . (i * i :))
      putMVar d ()
    return d
  mapM_ takeMVar dones
  readMVar results >>= print . sum
  ch <- newChan
  _ <- forkIO $ mapM_ (writeChan ch) [1 .. 3 :: Int]
  xs <- replicateM 3 (readChan ch)
  print xs
