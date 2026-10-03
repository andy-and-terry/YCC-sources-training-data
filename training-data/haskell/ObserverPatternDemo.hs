import Data.IORef
import Control.Monad (forM_)

-- Observers are just a list of IO callbacks stored in an IORef; "notify"
-- runs each one against the new value.
newtype Subject a = Subject (IORef [a -> IO ()])

newSubject :: IO (Subject a)
newSubject = Subject <$> newIORef []

subscribe :: Subject a -> (a -> IO ()) -> IO ()
subscribe (Subject ref) observer = modifyIORef ref (observer :)

notifyAll :: Subject a -> a -> IO ()
notifyAll (Subject ref) value = do
  observers <- readIORef ref
  forM_ observers ($ value)

main :: IO ()
main = do
  subject <- newSubject
  subscribe subject (\t -> putStrLn ("logger saw: " ++ show t))
  subscribe subject (\t -> putStrLn ("doubled: " ++ show (t * 2 :: Int)))
  notifyAll subject 10
  notifyAll subject 21
