import Data.IORef
import Control.Monad (forM_, replicateM)

main :: IO ()
main = do
  counter <- newIORef (0 :: Int)
  forM_ [1 .. 5] $ \_ -> modifyIORef counter (+ 1)
  total <- readIORef counter
  print total

  history <- newIORef ([] :: [Int])
  forM_ [10, 20, 30] $ \x -> modifyIORef history (x :)
  values <- readIORef history
  print (reverse values)

  writeIORef counter 0
  results <- replicateM 3 (modifyIORef counter (+ 2) >> readIORef counter)
  print results
