import Control.Concurrent (forkIO)
import Control.Concurrent.MVar

producer :: MVar Int -> [Int] -> IO ()
producer channel [] = putMVar channel (-1)
producer channel (x : xs) = do
  putMVar channel x
  producer channel xs

consumer :: MVar Int -> MVar [Int] -> IO ()
consumer channel resultVar = loop []
  where
    loop acc = do
      x <- takeMVar channel
      if x == -1
        then putMVar resultVar (reverse acc)
        else loop (x : acc)

main :: IO ()
main = do
  channel <- newEmptyMVar
  resultVar <- newEmptyMVar
  _ <- forkIO (consumer channel resultVar)
  producer channel [1, 2, 3, 4, 5]
  result <- takeMVar resultVar
  print result
  print (sum result)
