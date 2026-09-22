data Tree a = Leaf | Node (Tree a) a (Tree a)

instance Functor Tree where
  fmap _ Leaf = Leaf
  fmap f (Node left value right) = Node (fmap f left) (f value) (fmap f right)

toList :: Tree a -> [a]
toList Leaf = []
toList (Node left value right) = toList left ++ [value] ++ toList right

sampleTree :: Tree Int
sampleTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

main :: IO ()
main = do
  print (toList sampleTree)
  print (toList (fmap (* 10) sampleTree))
  print (toList (fmap show sampleTree))
