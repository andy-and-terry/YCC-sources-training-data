-- Aliquot sum classification.
aliquot :: Int -> Int
aliquot n = sum [d | d <- [1 .. n - 1], n `mod` d == 0]

kind :: Int -> Int -> String
kind n a = case compare a n of
  EQ -> "perfect"
  GT -> "abundant"
  LT -> "deficient"

main :: IO ()
main = mapM_ (\n -> putStrLn (unwords [show n, show (aliquot n), kind n (aliquot n)])) [6, 12, 15, 28]
