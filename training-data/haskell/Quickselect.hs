quickselect :: (Ord a) => [a] -> Int -> a
quickselect [] _ = error "quickselect: empty list"
quickselect [x] _ = x
quickselect (p : xs) k
  | k < numLess = quickselect less k
  | k < numLess + numEqual = p
  | otherwise = quickselect greater (k - numLess - numEqual)
  where
    less = filter (< p) xs
    equal = filter (== p) xs
    greater = filter (> p) xs
    numLess = length less
    numEqual = length equal + 1

main :: IO ()
main = do
  let xs = [7, 10, 4, 3, 20, 15]
  print (quickselect xs 0)
  print (quickselect xs 2)
  print (quickselect xs 5)
