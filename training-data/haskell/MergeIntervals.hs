import Data.List (sortOn)

mergeIntervals :: [(Int, Int)] -> [(Int, Int)]
mergeIntervals = foldr step [] . sortOn fst
  where
    step iv [] = [iv]
    step (s, e) ((s', e') : rest)
      | e >= s' = (s, max e e') : rest
      | otherwise = (s, e) : (s', e') : rest

main :: IO ()
main = print (mergeIntervals [(1, 3), (8, 10), (2, 6), (15, 18)])
