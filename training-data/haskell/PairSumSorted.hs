import Data.Array

pairWithSum :: Array Int Int -> Int -> Maybe (Int, Int)
pairWithSum arr target = go lo hi
  where
    (lo, hi) = bounds arr
    go i j
      | i >= j = Nothing
      | otherwise = case compare (arr ! i + arr ! j) target of
          EQ -> Just (i, j)
          LT -> go (i + 1) j
          GT -> go i (j - 1)

main :: IO ()
main = do
  let xs = [1, 3, 4, 6, 8, 11]
  print (pairWithSum (listArray (0, length xs - 1) xs) 10)
  print (pairWithSum (listArray (0, 2) [1, 2, 3]) 100)
