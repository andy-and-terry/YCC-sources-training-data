import qualified Data.Set as Set

main :: IO ()
main = do
  let a = Set.fromList [1, 2, 3, 4, 5]
      b = Set.fromList [4, 5, 6, 7]
  print (Set.toList (Set.union a b))
  print (Set.toList (Set.intersection a b))
  print (Set.toList (Set.difference a b))
  print (Set.member 3 a)
  print (Set.size a)
  print (Set.toList (Set.insert 10 a))
