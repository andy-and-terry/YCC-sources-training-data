myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x acc -> if p x then x : acc else acc) []

myLength :: [a] -> Int
myLength = foldr (\_ n -> n + 1) 0

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myAll :: (a -> Bool) -> [a] -> Bool
myAll p = foldr (\x acc -> p x && acc) True

compose :: [a -> a] -> a -> a
compose = foldr (.) id

main :: IO ()
main = do
  print (myMap (* 2) [1, 2, 3 :: Int])
  print (myFilter even [1 .. 10 :: Int])
  print (myLength "hello")
  print (myReverse [1, 2, 3 :: Int])
  print (myAll (> 0) [1, 2, 3 :: Int])
  print (compose [(+ 1), (* 2), subtract 3] (10 :: Int))
  print (takeWhile (< 30) (foldr (\x acc -> x : map (+ x) acc) [] [1 :: Int ..]))
