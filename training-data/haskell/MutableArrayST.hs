import Control.Monad
import Control.Monad.ST
import Data.Array.ST
import Data.Array.Unboxed

sieve :: Int -> [Int]
sieve n = [i | (i, True) <- assocs arr]
  where
    arr :: UArray Int Bool
    arr = runSTUArray $ do
      a <- newArray (2, n) True
      forM_ [2 .. n] $ \i -> do
        p <- readArray a i
        when (p && i * i <= n) $
          forM_ [i * i, i * i + i .. n] $ \j -> writeArray a j False
      return a

main :: IO ()
main = print (sieve 50)
