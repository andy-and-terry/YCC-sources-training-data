import Data.Array
import Data.List (isPrefixOf)

wordBreak :: String -> [String] -> Bool
wordBreak s dict = dp ! n
  where
    n = length s
    dp = listArray (0, n) [canBreak i | i <- [0 .. n]]

    canBreak 0 = True
    canBreak i =
      any (\w -> w `isPrefixOf` drop (i - length w) (take i s) && dp ! (i - length w))
          (filter (\w -> length w <= i) dict)

main :: IO ()
main = do
  print (wordBreak "leetcode" ["leet", "code"])
  print (wordBreak "applepenapple" ["apple", "pen"])
  print (wordBreak "catsandog" ["cats", "dog", "sand", "and", "cat"])
