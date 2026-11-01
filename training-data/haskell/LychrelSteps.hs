-- Reverse-and-add until a palindrome; count the steps.
rev :: Integer -> Integer
rev = read . reverse . show

steps :: Integer -> Int
steps = go 0
  where
    go count n
      | count > 0 && n == rev n = count
      | count >= 100 = -1
      | otherwise = go (count + 1) (n + rev n)

main :: IO ()
main = putStrLn . unwords . map (show . steps) $ [56, 57, 59, 79, 89]
