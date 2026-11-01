mapF :: (a -> b) -> [a] -> [b]
mapF f = foldr (\x acc -> f x : acc) []

filterF :: (a -> Bool) -> [a] -> [a]
filterF p = foldr (\x acc -> if p x then x : acc else acc) []

main :: IO ()
main = do
  print (mapF (* 2) [1, 2, 3])
  print (filterF even [1 .. 10])
