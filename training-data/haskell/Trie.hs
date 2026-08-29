import qualified Data.Map as Map
import Data.Map (Map)

data Trie = Trie { isEnd :: Bool, children :: Map Char Trie }

empty :: Trie
empty = Trie False Map.empty

insert :: String -> Trie -> Trie
insert [] t = t { isEnd = True }
insert (c:cs) t =
  let child = Map.findWithDefault empty c (children t)
  in t { children = Map.insert c (insert cs child) (children t) }

contains :: String -> Trie -> Bool
contains [] t = isEnd t
contains (c:cs) t = case Map.lookup c (children t) of
  Nothing -> False
  Just child -> contains cs child

main :: IO ()
main = do
  let t = foldr insert empty ["cat", "car", "dog"]
  print (contains "cat" t, contains "ca" t, contains "dog" t)
