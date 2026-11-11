-- Square of the sum minus sum of squares for 1..10 (expect 2640)
main :: IO ()
main = print (sum xs ^ 2 - sum (map (^ 2) xs))
  where
    xs = [1 .. 10] :: [Int]
