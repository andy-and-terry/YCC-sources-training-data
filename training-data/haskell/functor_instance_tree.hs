data Tree a = Leaf | Node (Tree a) a (Tree a)

instance Functor Tree where
  fmap _ Leaf = Leaf
  fmap f (Node l v r) = Node (fmap f l) (f v) (fmap f r)

toList :: Tree a -> [a]
toList Leaf = []
toList (Node l v r) = toList l ++ [v] ++ toList r

main :: IO ()
main = print (toList (fmap (+ 1) (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf))))
