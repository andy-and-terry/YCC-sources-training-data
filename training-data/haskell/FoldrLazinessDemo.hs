import Data.List (foldl')

myAny :: (a -> Bool) -> [a] -> Bool
myAny p = foldr (\x acc -> p x || acc) False

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p = foldr (\x acc -> if p x then x : acc else []) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

reverseViaFoldl :: [a] -> [a]
reverseViaFoldl = foldl (flip (:)) []

main :: IO ()
main = do
  -- foldr short-circuits on infinite lists thanks to laziness
  print (myAny (> 100) [1 ..])
  print (myTakeWhile (< 10) [1 ..])
  print (take 5 (myMap (* 2) [1 ..]))
  print (reverseViaFoldl [1, 2, 3, 4 :: Int])
  print (foldr (-) 0 [1, 2, 3 :: Int], foldl (-) 0 [1, 2, 3 :: Int])
  print (foldl' (+) 0 [1 .. 1000000 :: Int])
  print (foldr (\x k acc -> k (acc + x)) id [1, 2, 3 :: Int] 0)
  print (foldr1 max [3, 9, 2 :: Int], foldl1 min [3, 9, 2 :: Int])
  print (scanr (+) 0 [1, 2, 3 :: Int])
