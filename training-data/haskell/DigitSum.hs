digitSum :: Int -> Int
digitSum n
  | n < 10 = n
  | otherwise = n `mod` 10 + digitSum (n `div` 10)

main :: IO ()
main = print (digitSum 987654321)
