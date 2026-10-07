pythagoreanTriples :: Int -> [(Int, Int, Int)]
pythagoreanTriples n = [(a, b, c) | c <- [1 .. n], b <- [1 .. c], a <- [1 .. b], a * a + b * b == c * c]

primesUpTo :: Int -> [Int]
primesUpTo n = [x | x <- [2 .. n], all (\d -> x `mod` d /= 0) [2 .. x - 1]]

pairs :: [a] -> [b] -> [(a, b)]
pairs xs ys = [(x, y) | x <- xs, y <- ys]

main :: IO ()
main = do
  print (pythagoreanTriples 20)
  print (primesUpTo 30)
  print (pairs [1, 2, 3] "ab")
  print [x * x | x <- [1 .. 10], even x]
