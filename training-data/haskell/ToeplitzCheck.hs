isToeplitz :: Eq a => [[a]] -> Bool
isToeplitz rows = and (zipWith ok rows (drop 1 rows))
  where ok prev cur = drop 1 cur == init' prev (length cur - 1)
        init' xs n = take n xs

main :: IO ()
main = do
  print (isToeplitz [[1, 2, 3], [4, 1, 2], [5, 4, 1 :: Int]])
  print (isToeplitz [[1, 2], [2, 2 :: Int]])
