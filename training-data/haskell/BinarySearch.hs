import Data.Array

binarySearch :: Array Int Int -> Int -> Maybe Int
binarySearch arr target = go (bounds arr)
  where
    go (low, high)
      | low > high = Nothing
      | arr ! mid == target = Just mid
      | arr ! mid < target = go (mid + 1, high)
      | otherwise = go (low, mid - 1)
      where mid = (low + high) `div` 2

main :: IO ()
main = do
  let arr = listArray (0, 6) [1, 3, 5, 7, 9, 11, 13]
  print (binarySearch arr 7)
  print (binarySearch arr 4)
