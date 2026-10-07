import Data.List

main :: IO ()
main = do
  let xs = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
  print (sort xs)
  print (nub xs)
  print (group (sort xs))
  print (sortOn negate xs)
  print (partition even xs)
  print (isPrefixOf [3, 1] xs, isSuffixOf [5, 3] xs, isInfixOf [5, 9] xs)
  print (transpose [[1, 2, 3], [4, 5], [6 :: Int]])
  print (intercalate ", " ["a", "b", "c"])
  print (subsequences [1, 2, 3 :: Int])
  print (xs \\ [1, 5])
  print (tails "abc", inits "abc")
