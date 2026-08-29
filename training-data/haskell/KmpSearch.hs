import Data.Array

buildTable :: String -> Array Int Int
buildTable pat = arr
  where
    m = length pat
    patArr = listArray (0, m - 1) pat
    arr = listArray (0, m - 1) (0 : go 1 0)
    go i len
      | i >= m = []
      | patArr ! i == patArr ! len = (len + 1) : go (i + 1) (len + 1)
      | len /= 0 = go i (arr ! (len - 1))
      | otherwise = 0 : go (i + 1) 0

kmpSearch :: String -> String -> Maybe Int
kmpSearch text pat = go 0 0
  where
    n = length text
    m = length pat
    textArr = listArray (0, n - 1) text
    patArr = listArray (0, m - 1) pat
    table = buildTable pat
    go i j
      | j == m = Just (i - j)
      | i >= n = Nothing
      | textArr ! i == patArr ! j = go (i + 1) (j + 1)
      | j /= 0 = go i (table ! (j - 1))
      | otherwise = go (i + 1) 0

main :: IO ()
main = print (kmpSearch "ABABDABACDABABCABAB" "ABABCABAB")
