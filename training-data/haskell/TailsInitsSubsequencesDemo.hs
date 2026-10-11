import Data.List

main :: IO ()
main = do
  print (tails "abc")
  print (inits "abc")
  print (subsequences [1, 2, 3])
  print (isSubsequenceOf "ace" "abcde")
  print (map (take 2) (tails [1 .. 4]))
  print (filter ((== 3) . length) (subsequences "abcd"))
  print (zip3 [1 :: Int ..] (inits "ab") (tails "ab"))
  print (intersect [1, 2, 3, 4] [2, 4, 6], [1, 2, 3] \\ [2], union [1, 2] [2, 3])
  print (insert 3 [1, 2, 4, 5], delete 3 [1, 3, 2, 3])
