import Control.Exception
import System.IO

data MyErr = MyErr String deriving Show
instance Exception MyErr

main :: IO ()
main = do
  r <- try (evaluate (1 `div` (0 :: Int))) :: IO (Either ArithException Int)
  print r
  r2 <- try (throwIO (MyErr "boom")) :: IO (Either MyErr ())
  print r2
  handle (\e -> putStrLn ("caught: " ++ show (e :: SomeException))) (void' (evaluate (head ([] :: [Int]))))
  (putStrLn "in action" >> throwIO (MyErr "x")) `catch` (\(MyErr m) -> putStrLn ("handler " ++ m)) `finally` putStrLn "finalizer"
  res <- bracket (return 5) (\_ -> putStrLn "release") (\x -> return (x * 2))
  print res
  where void' a = a >> return ()
