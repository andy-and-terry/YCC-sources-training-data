import Data.List (zip4, unzip3)

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

pairwiseDiffs :: [Int] -> [Int]
pairwiseDiffs xs = zipWith (-) (tail xs) xs

dotProduct :: [Int] -> [Int] -> Int
dotProduct xs ys = sum (zipWith (*) xs ys)

main :: IO ()
main = do
  print (zip [1 :: Int ..] "abc")
  print (zipWith (+) [1, 2, 3] [10, 20, 30 :: Int])
  print (zipWith3 (\a b c -> a * b + c) [1, 2, 3] [4, 5, 6] [7, 8, 9 :: Int])
  print (unzip [(1 :: Int, 'a'), (2, 'b')])
  print (unzip3 [(1 :: Int, 'x', True), (2, 'y', False)])
  print (take 12 fibs)
  print (pairwiseDiffs [1, 4, 9, 16, 25])
  print (dotProduct [1, 2, 3] [4, 5, 6])
  print (zip4 [1 :: Int, 2] "ab" [True, False] [3.5 :: Double, 4.5])
  print (and (zipWith (<=) [1, 2, 3] (tail [1, 2, 3 :: Int])))
  print (lookup 2 (zip [1 :: Int ..] ["one", "two", "three"]))
