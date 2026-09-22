modPow :: Integer -> Integer -> Integer -> Integer
modPow _ 0 _ = 1
modPow base expo m
  | even expo = half * half `mod` m
  | otherwise = base `mod` m * (half * half `mod` m) `mod` m
  where half = modPow base (expo `div` 2) m

main :: IO ()
main = do
  print (modPow 2 10 1000)
  print (modPow 7 128 13)
  print (modPow 5 117 19)
