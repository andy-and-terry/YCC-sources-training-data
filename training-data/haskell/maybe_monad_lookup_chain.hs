import qualified Data.Map as M

main :: IO ()
main = do
  let users = M.fromList [(1, "a")]
      emails = M.fromList [("a", "a@x.io")]
  print (M.lookup 1 users >>= \n -> M.lookup n emails)
  print (M.lookup 2 users >>= \n -> M.lookup n emails)
