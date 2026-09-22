import Control.Monad.ST
import Data.STRef
import Control.Monad (forM_)

sumST :: [Int] -> Int
sumST xs = runST $ do
  total <- newSTRef 0
  forM_ xs $ \x -> modifySTRef' total (+ x)
  readSTRef total

fibST :: Int -> Integer
fibST n = runST $ do
  a <- newSTRef 0
  b <- newSTRef 1
  forM_ [1 .. n] $ \_ -> do
    av <- readSTRef a
    bv <- readSTRef b
    writeSTRef a bv
    writeSTRef b (av + bv)
  readSTRef a

main :: IO ()
main = do
  print (sumST [1 .. 100])
  print (fibST 10)
