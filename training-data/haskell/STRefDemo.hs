import Control.Monad
import Control.Monad.ST
import Data.STRef

sumST :: [Int] -> Int
sumST xs = runST $ do
  ref <- newSTRef 0
  forM_ xs $ \x -> modifySTRef' ref (+ x)
  readSTRef ref

fibST :: Int -> Integer
fibST n = runST $ do
  a <- newSTRef 0
  b <- newSTRef 1
  replicateM_ n $ do
    x <- readSTRef a
    y <- readSTRef b
    writeSTRef a y
    writeSTRef b $! x + y
  readSTRef a

countEvens :: [Int] -> Int
countEvens xs = runST $ do
  counter <- newSTRef 0
  forM_ xs $ \x -> when (even x) $ modifySTRef' counter (+ 1)
  readSTRef counter

main :: IO ()
main = do
  print (sumST [1 .. 100])
  print (map fibST [0 .. 10])
  print (fibST 90)
  print (countEvens [1 .. 25])
