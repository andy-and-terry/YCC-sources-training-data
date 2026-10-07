import Data.List (foldl')

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x acc -> if p x then x : acc else acc) []

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

compose :: [a -> a] -> a -> a
compose = foldr (.) id

main :: IO ()
main = do
  print (myMap (* 2) [1, 2, 3 :: Int])
  print (myFilter even [1 .. 10 :: Int])
  print (myReverse "haskell")
  print (compose [(+ 1), (* 2), subtract 3] (10 :: Int))
  print (foldl' (+) 0 [1 .. 100000 :: Int])
  print (foldr (\x acc -> x : take 2 acc) [] [1 .. 10 :: Int])
