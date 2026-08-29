main :: IO ()
main = do
  print (foldl (+) 0 [1 .. 10])
  print (foldr (:) [] [1, 2, 3])
  print (foldl (flip (:)) [] [1, 2, 3])
