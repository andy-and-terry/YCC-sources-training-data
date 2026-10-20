main :: IO ()
main = do
  print (foldr (\x acc -> x : take 2 acc) [] [1 .. 10 :: Int])
  print (foldl (flip (:)) [] "abc")
  print (scanl (+) 0 [1, 2, 3, 4 :: Int])
  print (zipWith3 (\a b c -> a + b * c) [1, 2] [3, 4] [5, 6 :: Int])
