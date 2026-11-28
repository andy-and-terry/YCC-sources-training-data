duval :: String -> [String]
duval [] = []
duval s = replicate cnt w ++ duval rest
  where
    (w, rest, cnt) = scan s
    scan xs = let len = lyndonLen xs in (take len xs, drop (len * reps xs len) xs, reps xs len)
    reps xs len = go 1 (drop len xs)
      where go c ys | take len ys == take len xs = go (c + 1) (drop len ys)
                    | otherwise = c
    lyndonLen xs = loop 1 0
      where
        n = length xs
        loop j k
          | j < n && xs !! k <= xs !! j = loop (j + 1) (if xs !! k < xs !! j then 0 else k + 1)
          | otherwise = j - k

main :: IO ()
main = print (duval "banana")
