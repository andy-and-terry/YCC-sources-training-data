import Control.Monad (guard)

pythag :: Int -> [(Int, Int, Int)]
pythag n = do
  a <- [1 .. n]
  b <- [a .. n]
  c <- [b .. n]
  guard (a * a + b * b == c * c)
  return (a, b, c)

pairsSumTo :: Int -> [Int] -> [(Int, Int)]
pairsSumTo t xs = [(x, y) | x <- xs, y <- xs, x < y, x + y == t]

main :: IO ()
main = do
  print (pythag 20)
  print (pairsSumTo 10 [1 .. 9])
  print (concatMap (\x -> [x, x * 10]) [1, 2, 3])
  print (concat [[1], [], [2, 3]])
  print (and [], or [], all even [2, 4], any odd [2, 4])
