import Data.Array

-- Builds the Z-array: z[i] is the length of the longest prefix of s that
-- also starts at position i.
zArray :: String -> Array Int Int
zArray s = buildZ 1 0 0 (listArray (0, n - 1) (replicate n 0))
  where
    n = length s
    arr = listArray (0, n - 1) s

    buildZ i l r z
      | i >= n = z
      | otherwise =
          let z0 = if i < r then min (r - i) (z ! (i - l)) else 0
              zi = extend i z0
              l' = if i + zi > r then i else l
              r' = if i + zi > r then i + zi else r
          in buildZ (i + 1) l' r' (z // [(i, zi)])

    extend i zi
      | i + zi < n && arr ! zi == arr ! (i + zi) = extend i (zi + 1)
      | otherwise = zi

search :: String -> String -> [Int]
search pattern text =
  let combined = pattern ++ "$" ++ text
      z = zArray combined
      plen = length pattern
  in [i - plen - 1 | i <- [plen + 1 .. length combined - 1], z ! i == plen]

main :: IO ()
main = print (search "abc" "abxabcabcaby")
