import Data.List (sort)
import qualified Data.Map as Map

bucketSort :: Int -> [Double] -> [Double]
bucketSort numBuckets xs = concatMap sort (Map.elems buckets)
  where
    bucketOf x = min (numBuckets - 1) (floor (x * fromIntegral numBuckets))
    buckets =
      foldr
        (\x m -> Map.insertWith (++) (bucketOf x) [x] m)
        (Map.fromList [(i, []) | i <- [0 .. numBuckets - 1]])
        xs

main :: IO ()
main = print (bucketSort 5 [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])
