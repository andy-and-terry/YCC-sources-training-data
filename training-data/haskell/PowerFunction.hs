power :: Int -> Int -> Int
power _ 0 = 1
power base exp
  | even exp = half * half
  | otherwise = base * half * half
  where half = power base (exp `div` 2)

main :: IO ()
main = print (power 2 10)
