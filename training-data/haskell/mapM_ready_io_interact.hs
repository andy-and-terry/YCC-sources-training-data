import Control.Monad
import Data.IORef
import System.IO

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  ref <- newIORef (0 :: Int)
  forM_ [1 .. 5] $ \i -> modifyIORef ref (+ i)
  readIORef ref >>= print
  when True $ putStrLn "when"
  unless False $ putStrLn "unless"
  xs <- forM [1 .. 3] (\i -> return (i * i))
  print xs
  r <- foldM (\acc x -> do { putStrLn ("acc " ++ show acc); return (acc + x) }) 0 [1, 2, 3]
  print r
  print =<< replicateM 2 (return 'x')
  print (replicateM 2 "ab")
  mapM_ print (zip [1 :: Int ..] "ab")
