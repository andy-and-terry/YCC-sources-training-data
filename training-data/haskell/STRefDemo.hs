import Control.Monad.ST
import Data.STRef

sumST :: [Int] -> Int
sumST xs = runST $ do
  ref <- newSTRef 0
  mapM_ (\x -> modifySTRef' ref (+ x)) xs
  readSTRef ref

fibST :: Int -> Integer
fibST n = runST $ do
  a <- newSTRef 0
  b <- newSTRef 1
  mapM_ (\_ -> do
          x <- readSTRef a
          y <- readSTRef b
          writeSTRef a y
          writeSTRef b (x + y)) [1 .. n]
  readSTRef a

main :: IO ()
main = do
  print (sumST [1 .. 100])
  print (fibST 50)
