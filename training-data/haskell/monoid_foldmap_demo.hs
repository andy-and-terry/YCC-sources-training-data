import Data.Monoid

main :: IO ()
main = do
  print (getSum (foldMap Sum [1 .. 10]))
  print (getProduct (foldMap Product [1 .. 5]))
  print (getAll (foldMap (All . even) [2, 4, 6]))
  print (mconcat ["ab", "cd", "ef"])
