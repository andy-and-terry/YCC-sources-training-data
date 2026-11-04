gcdAll :: [Int] -> Int
gcdAll = foldr gcd 0

main :: IO ()
main = do
  print (gcdAll [12, 18, 24])
  print (gcdAll [7, 13])
  print (foldr lcm 1 [4, 6, 10])
