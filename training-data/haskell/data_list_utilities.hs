import Data.List
import Data.Char (toUpper, isDigit)
import Data.Ord (comparing, Down (..))
import qualified Data.Map as M

main :: IO ()
main = do
  print (sort "hello", nub [1, 2, 1, 3, 2], group (sort "mississippi"))
  print (map (\g -> (head g, length g)) . group . sort $ "mississippi")
  print (sortBy (comparing Down) [3, 1, 2], sortOn negate [3, 1, 2], partition even [1 .. 6])
  print (isPrefixOf "ab" "abc", isInfixOf "ss" "miss", "a,b,c" `splitOn'` ',')
  print (intercalate ", " ["a", "b"], transpose ["abc", "de"], subsequences [1, 2, 3])
  print (permutations [1, 2, 3], zip3 [1, 2] "ab" [True, False], lookup 2 [(1, "a"), (2, "b")])
  print (M.toList (M.fromListWith (+) [(c, 1 :: Int) | c <- "banana"]))
  where splitOn' s c = case break (== c) s of (a, []) -> [a]; (a, _ : r) -> a : splitOn' r c
