import Data.Array

editDistance :: String -> String -> Int
editDistance a b = table ! (m, n)
  where
    m = length a
    n = length b
    aArr = listArray (1, m) a
    bArr = listArray (1, n) b
    table = array ((0, 0), (m, n))
      [((i, j), cell i j) | i <- [0 .. m], j <- [0 .. n]]
    cell 0 j = j
    cell i 0 = i
    cell i j
      | aArr ! i == bArr ! j = table ! (i - 1, j - 1)
      | otherwise = 1 + minimum [table ! (i - 1, j), table ! (i, j - 1), table ! (i - 1, j - 1)]

main :: IO ()
main = print (editDistance "kitten" "sitting")
