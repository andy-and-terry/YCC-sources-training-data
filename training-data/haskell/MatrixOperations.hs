type Matrix = [[Int]]

transpose' :: Matrix -> Matrix
transpose' [] = []
transpose' ([]:_) = []
transpose' xs = map head xs : transpose' (map tail xs)

multiply :: Matrix -> Matrix -> Matrix
multiply a b = [[sum (zipWith (*) row col) | col <- transpose' b] | row <- a]

main :: IO ()
main = do
  let a = [[1, 2], [3, 4]]
      b = [[5, 6], [7, 8]]
  print (multiply a b)
