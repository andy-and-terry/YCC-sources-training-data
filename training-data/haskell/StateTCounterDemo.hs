import Control.Monad.State

type Counter = StateT Int IO

tick :: Counter Int
tick = do
  n <- get
  put (n + 1)
  lift (putStrLn ("tick " ++ show n))
  return n

main :: IO ()
main = do
  (xs, final) <- runStateT (replicateM 3 tick) 10
  print xs
  print final
  r <- evalStateT (do { modify (* 2); gets (+ 1) }) 5
  print r
  execStateT (forM_ [1 .. 4] (\i -> modify (+ i))) 0 >>= print
