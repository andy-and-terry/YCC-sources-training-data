import Data.Array

lcs :: String -> String -> Int
lcs a b = table ! (m, n)
  where
    m = length a
    n = length b
    aArr = listArray (1, m) a
    bArr = listArray (1, n) b
    table = array ((0, 0), (m, n))
      [((i, j), cell i j) | i <- [0 .. m], j <- [0 .. n]]
    cell 0 _ = 0
    cell _ 0 = 0
    cell i j
      | aArr ! i == bArr ! j = 1 + table ! (i - 1, j - 1)
      | otherwise = max (table ! (i - 1, j)) (table ! (i, j - 1))

main :: IO ()
main = print (lcs "ABCBDAB" "BDCABA")
