import Data.Array
import qualified Data.Set as Set
import Data.Set (Set)

-- Can the string be segmented into a space-separated sequence of
-- dictionary words?
wordBreak :: String -> Set String -> Bool
wordBreak s dict = dp ! n
  where
    n = length s
    sArr = listArray (0, n - 1) s
    dp = listArray (0, n) [canBreak i | i <- [0 .. n]]

    canBreak 0 = True
    canBreak i = any ok [0 .. i - 1]
      where
        ok j = dp ! j && Set.member (substring j i) dict
    substring j i = [sArr ! k | k <- [j .. i - 1]]

main :: IO ()
main = do
  let dict = Set.fromList ["leet", "code", "cats", "cat", "sand", "and", "dog"]
  print (wordBreak "leetcode" dict)
  print (wordBreak "catsanddog" dict)
  print (wordBreak "catsandog" dict)
