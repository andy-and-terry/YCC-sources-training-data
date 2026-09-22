import qualified Data.Set as Set
import Data.Array

wordBreak :: String -> [String] -> Bool
wordBreak s dict = dp ! n
  where
    n = length s
    wordSet = Set.fromList dict
    sArr = listArray (0, n - 1) s
    dp = listArray (0, n) [canBreak i | i <- [0 .. n]]
    canBreak 0 = True
    canBreak i = any (\j -> dp ! j && Set.member (substring j i) wordSet) [0 .. i - 1]
    substring j i = [sArr ! k | k <- [j .. i - 1]]

main :: IO ()
main = do
  print (wordBreak "leetcode" ["leet", "code"])
  print (wordBreak "catsandog" ["cats", "dog", "sand", "and", "cat"])
