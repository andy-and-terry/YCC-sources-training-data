import Control.Monad.ST
import Data.STRef
import Control.Monad (forM_)

-- The ST monad allows genuinely mutable state inside a function that is
-- still pure from the outside: runST guarantees the mutation can't leak.
sumWithMutation :: [Int] -> Int
sumWithMutation xs = runST $ do
  ref <- newSTRef 0
  forM_ xs $ \x -> modifySTRef ref (+ x)
  readSTRef ref

main :: IO ()
main = do
  print (sumWithMutation [1 .. 100])
  print (sumWithMutation [5, 10, 15])
