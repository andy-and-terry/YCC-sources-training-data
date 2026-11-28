chunks :: Int -> [a] -> [[a]]
chunks _ [] = []
chunks n xs = take n xs : chunks n (drop n xs)

query :: Int -> [Int] -> [Int] -> Int -> Int -> Int
query bs a blk l r = go l 0
  where
    go i acc
      | i > r = acc
      | i `mod` bs == 0 && i + bs - 1 <= r = go (i + bs) (acc + blk !! (i `div` bs))
      | otherwise = go (i + 1) (acc + a !! i)

main :: IO ()
main = print (query 4 a (map sum (chunks 4 a)) 2 9)
  where a = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5]
