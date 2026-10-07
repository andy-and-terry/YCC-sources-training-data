windows :: Int -> [Int] -> [[Int]]
windows k xs
  | length xs < k = []
  | otherwise = take k xs : windows k (tail xs)

maxWindowSum :: Int -> [Int] -> Int
maxWindowSum k xs
  | null (windows k xs) = 0
  | otherwise = maximum (map sum (windows k xs))

slidingWindowMaxima :: Int -> [Int] -> [Int]
slidingWindowMaxima k xs = map maximum (windows k xs)

main :: IO ()
main = do
  print (maxWindowSum 3 [2, 1, 5, 1, 3, 2])
  print (slidingWindowMaxima 3 [1, 3, -1, -3, 5, 3, 6, 7])
