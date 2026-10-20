import qualified Data.Map.Strict as M
import qualified Data.Set as S

main :: IO ()
main = do
  let m = M.fromList [(1, "a"), (2, "b"), (3, "c")]
  print (M.lookup 2 m, M.findWithDefault "?" 9 m, M.member 3 m, M.size m)
  print (M.toList (M.insertWith (++) 2 "x" m))
  print (M.foldrWithKey (\k v acc -> show k ++ v ++ acc) "" m)
  print (M.keys (M.filter (> "a") m), M.elems (M.map succ' m))
  print (M.unionWith (++) m (M.fromList [(3, "z"), (4, "d")]))
  print (M.lookupMin m, M.lookupMax m, fst <$> M.lookupLE 2 m)
  let s = S.fromList "mississippi"
  print (s, S.member 'm' s, S.toList (S.map succ s), S.size s)
  print (S.union (S.fromList [1, 2]) (S.fromList [2, 3]), S.difference (S.fromList [1, 2, 3]) (S.fromList [2]))
  where succ' = map succ
