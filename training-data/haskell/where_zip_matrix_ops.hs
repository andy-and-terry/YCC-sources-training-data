import Data.List (transpose)

type Matrix = [[Int]]

mmul :: Matrix -> Matrix -> Matrix
mmul a b = [[sum (zipWith (*) r c) | c <- transpose b] | r <- a]

identity :: Int -> Matrix
identity n = [[fromEnum (i == j) | j <- [1 .. n]] | i <- [1 .. n]]

mpow :: Matrix -> Int -> Matrix
mpow m 0 = identity (length m)
mpow m n | even n = let h = mpow m (n `div` 2) in mmul h h
         | otherwise = mmul m (mpow m (n - 1))

main :: IO ()
main = do
  print (mmul [[1, 2], [3, 4]] [[0, 1], [1, 0]])
  print (head (head (mpow [[1, 1], [1, 0]] 30)) )
  print (transpose [[1, 2, 3], [4, 5, 6]])
