import qualified Data.IntMap.Strict as IM

main :: IO ()
main = do
  let m = IM.fromListWith (+) [(3, 1), (1, 5), (3, 10), (7, 2)]
  print m
  print (IM.lookup 3 m, IM.lookup 4 m)
  print (IM.findWithDefault 0 9 m)
  print (IM.toAscList (IM.map (* 2) m))
  print (IM.lookupLT 3 m, IM.lookupGE 4 m)
  print (IM.unionWith (+) m (IM.fromList [(1, 100), (8, 8)]))
  print (IM.foldrWithKey (\k v acc -> k + v + acc) 0 m)
  print (IM.alter (fmap (+ 1)) 7 m IM.! 7)
