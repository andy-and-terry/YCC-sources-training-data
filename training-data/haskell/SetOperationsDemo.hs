import qualified Data.Set as S

main :: IO ()
main = do
  let a = S.fromList [1 .. 6]
      b = S.fromList [4 .. 9]
  print (S.union a b)
  print (S.intersection a b)
  print (S.difference a b)
  print (S.isSubsetOf (S.fromList [2, 3]) a)
  print (S.member 7 a, S.size b)
  print (S.toList (S.map (`mod` 3) a))
  print (S.partition even a)
  print (S.findMin b, S.findMax b)
  print (S.elems (S.filter (> 7) b))
  print (S.lookupGT 6 b)
