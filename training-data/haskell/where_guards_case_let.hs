classify :: Int -> String
classify n
  | n < 0 = "negative"
  | n == 0 = "zero"
  | n < small = "small"
  | otherwise = big
  where small = 10
        big = "big:" ++ show n

collatz :: Int -> Int
collatz n = go n 0 where
  go 1 acc = acc
  go m acc | even m = go (m `div` 2) (acc + 1)
           | otherwise = go (3 * m + 1) (acc + 1)

main :: IO ()
main = do
  mapM_ (putStrLn . classify) [-1, 0, 5, 50]
  print (collatz 27)
  let (q, r) = 17 `divMod` 5
      f x = x * q
  print (f r, case compare q r of LT -> "lt"; EQ -> "eq"; GT -> "gt")
