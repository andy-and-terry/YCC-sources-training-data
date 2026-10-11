import Data.List (sortBy)
import Data.Ord (comparing)
import Data.Monoid

data Emp = Emp { ename :: String, dept :: String, salary :: Int } deriving Show

emps :: [Emp]
emps =
  [ Emp "zed" "ops" 50, Emp "amy" "dev" 70
  , Emp "bob" "dev" 70, Emp "cat" "ops" 60 ]

main :: IO ()
main = do
  let cmp = comparing dept <> comparing (negate . salary) <> comparing ename
  mapM_ print (sortBy cmp emps)
  print (getSum (foldMap (Sum . salary) emps))
  print (getAll (foldMap (All . (> 40) . salary) emps))
  print (getFirst (First (Just 1) <> First Nothing <> First (Just 3)))
  print (getLast (Last (Just 1) <> Last Nothing <> Last (Just 3)))
