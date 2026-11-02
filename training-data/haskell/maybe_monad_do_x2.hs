import qualified Data.Map as M

lookupBoth :: M.Map String Int -> Maybe Int
lookupBoth m = do
  a <- M.lookup "a" m
  b <- M.lookup "b" m
  return (a + b)

main :: IO ()
main = print (lookupBoth (M.fromList [("a", 1), ("b", 2)]), lookupBoth M.empty)
