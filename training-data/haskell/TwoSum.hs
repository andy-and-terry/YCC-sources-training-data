import qualified Data.Map as Map

twoSum :: [Int] -> Int -> Maybe (Int, Int)
twoSum xs target = go xs Map.empty 0
  where
    go [] _ _ = Nothing
    go (y:ys) seen i = case Map.lookup (target - y) seen of
      Just j -> Just (j, i)
      Nothing -> go ys (Map.insert y i seen) (i + 1)

main :: IO ()
main = print (twoSum [2, 7, 11, 15] 9)
