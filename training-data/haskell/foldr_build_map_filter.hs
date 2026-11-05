main :: IO ()
main = do
  print (foldr (\x acc -> x * 2 : acc) [] [1 .. 5])
  print (foldr (\x acc -> if even x then x : acc else acc) [] [1 .. 10])
  print (foldl (flip (:)) [] [1, 2, 3])
