import Data.List (transpose, zipWith3, unfoldr)

pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)

dotProduct :: [Int] -> [Int] -> Int
dotProduct xs ys = sum (zipWith (*) xs ys)

main :: IO ()
main = do
  print (pairs [1, 2, 3, 4 :: Int])
  print (dotProduct [1, 2, 3] [4, 5, 6])
  print (transpose [[1, 2, 3], [4, 5, 6 :: Int]])
  print (zipWith3 (\a b c -> a + b * c) [1, 2] [3, 4] [5, 6 :: Int])
  print (unzip [(1 :: Int, 'a'), (2, 'b')])
  print (unfoldr (\n -> if n > 60 then Nothing else Just (n, n * 2)) (1 :: Int))
