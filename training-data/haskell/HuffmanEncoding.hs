import Data.List (sortBy, insertBy)
import Data.Ord (comparing)
import qualified Data.Map as Map

data HTree = Leaf Char Int | Branch HTree HTree Int

weight :: HTree -> Int
weight (Leaf _ w) = w
weight (Branch _ _ w) = w

buildTree :: [(Char, Int)] -> HTree
buildTree freqs = go (sortBy (comparing weight) (map (uncurry Leaf) freqs))
  where
    go [t] = t
    go (a : b : rest) =
      let merged = Branch a b (weight a + weight b)
      in go (insertBy (comparing weight) merged rest)
    go [] = error "cannot build a tree from no symbols"

codes :: HTree -> Map.Map Char String
codes tree = Map.fromList (go tree "")
  where
    go (Leaf c _) prefix = [(c, if null prefix then "0" else prefix)]
    go (Branch l r _) prefix = go l (prefix ++ "0") ++ go r (prefix ++ "1")

encode :: Map.Map Char String -> String -> String
encode table = concatMap (\c -> Map.findWithDefault "" c table)

main :: IO ()
main = do
  let freqs = [('a', 5), ('b', 9), ('c', 12), ('d', 13), ('e', 16), ('f', 45)]
      tree = buildTree freqs
      table = codes tree
  print (Map.toList table)
  print (encode table "abc")
